{ config, pkgs, ... }:

let
  customNodePackages = import ../nodejs/default.nix {};
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
      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp_luasnip
      customVimPlugins.stylua-nvim
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
      customNodePackages.bash-language-server
      pkgs.gopls
      pkgs.haskell-language-server
      pkgs.kotlin-language-server
      pkgs.lua-language-server
      pkgs.nodePackages.pyright
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.rnix-lsp
      pkgs.rust-analyzer
      pkgs.shellcheck
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
