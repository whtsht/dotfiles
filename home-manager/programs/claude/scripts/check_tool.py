#!/usr/bin/env python3

import json
import subprocess
import sys
from datetime import datetime
from pathlib import Path
import duckdb


def get_db_path():
    return Path.home() / ".claude_histories.db"


def init_database():
    db_path = get_db_path()
    conn = duckdb.connect(str(db_path))

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS tool_history (
            id INTEGER PRIMARY KEY,
            timestamp TIMESTAMP NOT NULL,
            tool VARCHAR NOT NULL,
            value TEXT NOT NULL,
            decision VARCHAR NOT NULL,
            reason TEXT NOT NULL
        )
    """
    )

    conn.execute(
        """
        CREATE INDEX IF NOT EXISTS idx_timestamp ON tool_history(timestamp)
    """
    )

    conn.execute(
        """
        CREATE INDEX IF NOT EXISTS idx_tool ON tool_history(tool)
    """
    )

    conn.close()


def check_history(tool_name, value):
    try:
        db_path = get_db_path()
        conn = duckdb.connect(str(db_path))

        result = conn.execute(
            """
            SELECT decision FROM tool_history
            WHERE tool = ? AND value = ?
            ORDER BY timestamp DESC
            LIMIT 1
            """,
            (tool_name, value),
        ).fetchone()

        conn.close()

        if result:
            decision = result[0]
            if decision == "allowed":
                return "ok"
            elif decision == "denied":
                return "dangerous"

        return None

    except Exception as e:
        print(f"History lookup failed: {e}", file=sys.stderr)
        return None


def load_settings():
    settings_path = Path.home() / ".claude/settings.json"
    try:
        with open(settings_path) as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return {"permissions": {"allow": [], "deny": []}}


def log_history(tool_name, value, decision, reason):
    try:
        db_path = get_db_path()
        conn = duckdb.connect(str(db_path))

        max_id = conn.execute(
            "SELECT COALESCE(MAX(id), 0) FROM tool_history"
        ).fetchone()[0]
        next_id = max_id + 1

        conn.execute(
            """
            INSERT INTO tool_history (id, timestamp, tool, value, decision, reason)
            VALUES (?, ?, ?, ?, ?, ?)
        """,
            (next_id, datetime.now(), tool_name, value, decision, reason),
        )

        conn.close()
    except Exception as e:
        print(f"Failed to write history: {e}", file=sys.stderr)


def ask_claude(tool_name, value):
    prompt = f"'{tool_name}({value})' - Is this safe? Consider: local file operations in working directory are generally safe, commands without external network access are safe. System modifications or external communications may be dangerous. Respond only with 'ok' or 'dangerous'."

    try:
        result = subprocess.run(
            ["claude", "--model", "Sonnet", "-p", prompt],
            capture_output=True,
            text=True,
            timeout=30,
        )

        if result.returncode != 0:
            log_history(tool_name, value, "error", "timeout or error")
            return "dangerous"

        response = result.stdout.strip().lower()
        if "ok" in response:
            return "ok"
        else:
            return "dangerous"

    except Exception as e:
        log_history(tool_name, value, "error", "claude error - " + str(e))
        return "dangerous"


def main():
    init_database()

    try:
        input_data = sys.stdin.read()
        data = json.loads(input_data)
        tool_name = data.get("tool_name", "")

        if tool_name == "Bash":
            value = data.get("tool_input", {}).get("command", "")
        else:  # Read, Write, Edit, MultiEdit
            value = data.get("tool_input", {}).get("file_path", "")

        settings = load_settings()

        history_result = check_history(tool_name, value)

        if history_result == "ok":
            log_history(tool_name, value, "allowed", "history_hit")
            print(f"{tool_name} approved: {value}", file=sys.stderr)
            sys.exit(0)
        elif history_result == "dangerous":
            log_history(tool_name, value, "denied", "history_hit")
            print(f"{tool_name} rejected (dangerous): {value}", file=sys.stderr)
            sys.exit(2)

        # No cache hit, ask Claude
        claude_response = ask_claude(tool_name, value)

        if claude_response == "ok":
            log_history(tool_name, value, "allowed", "claude_approved")
            print(f"{tool_name} approved: {value}", file=sys.stderr)
            sys.exit(0)
        elif claude_response == "dangerous":
            log_history(tool_name, value, "denied", "claude_dangerous")
            print(f"{tool_name} rejected (dangerous): {value}", file=sys.stderr)
            sys.exit(2)
        else:  # dangerous
            log_history(tool_name, value, "denied", "claude_dangerous")
            print(f"{tool_name} rejected (dangerous): {value}", file=sys.stderr)
            sys.exit(2)

    except json.JSONDecodeError:
        print("Validation failed: invalid JSON input", file=sys.stderr)
        sys.exit(2)
    except Exception as e:
        print(f"Validation failed: {e}", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()
