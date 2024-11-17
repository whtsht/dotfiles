{ config, pkgs, dotLoc, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = (with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-containers
      mkhl.direnv
      github.github-vscode-theme
      eamodio.gitlens
      ritwickdey.liveserver
      shopify.ruby-lsp
      rust-lang.rust-analyzer
      asvetliakov.vscode-neovim
      jnoortheen.nix-ide
    ]);
  };

  home.file = {
    "./.config/Code/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/vscode/settings.json";
    };

    "./.config/Code/User/keybindings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/home/programs/vscode/keybindings.json";
    };
  };
}
