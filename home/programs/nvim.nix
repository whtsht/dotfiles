{ config, dotLoc, pkgs, ... }:

let
  skkeleton = pkgs.vimUtils.buildVimPlugin {
    name = "skkeleton";
    src = pkgs.fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "main";
      hash = "sha256-V86J+8rg1/5ZUL9t0k2S5H+z7KZ1DZwLwmb5yM0+vts=";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      tokyonight-nvim
      gitsigns-nvim
      vim-matchup
      nvim-lspconfig
      lspsaga-nvim
      fidget-nvim
      vim-fugitive
      toggleterm-nvim
      fzf-lua
      nvim-web-devicons
      copilot-lua
      lualine-nvim
      nui-nvim
      noice-nvim
      nvim-treesitter
      nvim-treesitter.withAllGrammars
      luasnip
      friendly-snippets
      nvim-surround
      nvim-autopairs

      denops-vim
      skkeleton

      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-nvim-lsp
      cmp_luasnip
    ];
  };

  home.file = {
    "./.config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotLoc}/config/nvim";
    };
  };
}
