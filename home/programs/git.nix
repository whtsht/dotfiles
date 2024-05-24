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
        pager = "diffr | less";
      };
      pull = {
        ff = "only";
      };
    };
  };
}
