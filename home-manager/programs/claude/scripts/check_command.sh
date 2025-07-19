#!/usr/bin/env bash

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command' 2>/dev/null || echo "")

RESULT=$(claude -p "/check_command $COMMAND" 2>/dev/null)

if echo "$RESULT" | grep -q "ok"; then
    echo "Command approved: $COMMAND"
    exit 0
elif echo "$RESULT" | grep -q "dangerous"; then
    echo "Command rejected (dangerous): $COMMAND"
    exit 2
else
    echo "Command validation failed: $COMMAND"
    exit 2
fi
