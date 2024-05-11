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
      };
      pull = {
        ff = "only";
      };
      commit = {
        gpgsign = "true";
      };
      user = {
        signingkey = "22419B841495187E";
      };
    };
  };
}
