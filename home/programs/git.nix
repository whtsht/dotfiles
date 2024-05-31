{
  programs.git = {
    enable = true;

    userName = "whtsht";
    userEmail = "whiteshirt0079@gmail.com";

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
      alias = {
        ps = "push";
        pl = "pull";
        st = "status -sb";
        ll = "log --oneline";
        la = "log -1 HEAD --stat";
        df = "diff";
        cl = "clean -f -d";
      };
    };
  };
}
