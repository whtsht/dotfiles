{ config, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink ../../config/nvim;
    };

   # "./.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/init.lua" = {
   #   source = config.lib.file.mkOutOfStoreSymlink ../../config/nvim/lazyvim.lua;
   # };
  };
}
