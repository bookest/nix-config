{ config, pkgs, ... }:

let
  customVimPlugins = import ./plugins/default.nix {};
in
{
  # Disable neovim nightly until tree-sitter is updated in nixpkgs.
  #
  # https://github.com/NixOS/nixpkgs/pull/225152
  #
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  #   }))
  # ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp_luasnip
      customVimPlugins.stylua-nvim
      customVimPlugins.vim-jjdescription
      direnv-vim
      fidget-nvim
      fugitive
      gitsigns-nvim
      gruvbox-material
      harpoon
      haskell-vim
      kotlin-vim
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      rust-vim
      telescope-nvim
      typescript-vim
      vim-better-whitespace
      vim-commentary
      vim-go
      vim-nix
      vim-surround
    ];

    extraConfig = ''
      lua require('bookest')
    '';

    extraPackages = [
      pkgs.bash-language-server
      pkgs.gopls
      pkgs.haskell-language-server
      pkgs.kotlin-language-server
      pkgs.lua-language-server
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.pyright
      pkgs.rust-analyzer
      pkgs.shellcheck
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
