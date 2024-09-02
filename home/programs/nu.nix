{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.STARSHIP_SHELL = "nu"

      def create_left_prompt [] {
        starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
      }

# Use nushell functions to define your right and left prompt
    $env.PROMPT_COMMAND = { || create_left_prompt }
    $env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
      $env.PROMPT_INDICATOR = ""
      $env.PROMPT_INDICATOR_VI_INSERT = ": "
      $env.PROMPT_INDICATOR_VI_NORMAL = "〉"
      $env.PROMPT_MULTILINE_INDICATOR = "::: "
    '';
    shellAliases = {
      e    = "nvim";
      m    = "mkdir";
      mp   = "mkdir -p";
      rm   = "trash-put";
      u    = "cd ..";
      uu   = "cd ../..";
      uuu  = "cd ../../..";
      sw   = "sudo nixos-rebuild switch --flake . --impure";
      ls   = "exa";
      open = "handlr open";

      # git
      gs  = "git status --short";
      ga  = "git add";
      gaa = "git add --all";
      glg = "git log --graph";
      gc  = "git commit";
      gcm = "git commit --message";
      gbl = "git blame";
      gd  = "git diff";
      gdc = "git diff --cached";
      gsw = "git switch";
      gsc = "git switch --create";
      gcp = "git cherry-pick";
      gsh = "git stash push";
      gsp = "git stash pop";
      gsl = "git stash list";
      gb  = "git branch";
      gba = "git branch --all";
      gbd = "git branch --delete";
      gbD = "git branch --delete --force";
      gl  = "git fetch ; git pull origin $(git branch --show current)";
      gp  = "git push origin $(git branch --show current)";
      gpf = "git push --force --force-with-lease --force-if-includes origin $(git branch --show current)";
    };
  };
}
