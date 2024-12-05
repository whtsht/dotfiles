{ config, dotLoc, ... }:
{
  programs.git = {
    enable = true;

    userName = "whtsht";
    userEmail = "whiteshirt0079@gmail.com";

    ignores = [
      # direnv
      ".envrc"
      "/.direnv/"
    ];

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "nvim";
        pager = "delta --color-only --line-numbers";
      };
      interactive = {
        diffFilter = "delta --color-only --line-numbers";
      };
      pull = {
        ff = "only";
      };
    };
  };
}
