{ config, ... }:

{
  home.file = {
    ".claude/CLAUDE.md" = {
      source = builtins.path {
        path = ./CLAUDE.md;
        name = "claude-readme";
      };
    };
    ".claude/commands" = {
      source = builtins.path {
        path = ./commands;
        name = "claude-commands";
      };
    };
    ".claude/agents" = {
      source = builtins.path {
        path = ./agents;
        name = "claude-agents";
      };
    };
    ".claude/settings.json" = {
      source = builtins.path {
        path = ./settings.json;
        name = "claude-settings";
      };
    };
  };
}
