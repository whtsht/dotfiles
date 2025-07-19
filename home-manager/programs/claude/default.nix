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
    ".claude/scripts" = {
      source = builtins.path {
        path = ./scripts;
        name = "claude-scripts";
      };
    };
  };
}
