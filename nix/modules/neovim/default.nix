{ config, pkgs, ... }:

let
  customNodePackages = import ../nodejs/default.nix {};
  customVimPlugins = import ./plugins/default.nix {};
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

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
      cmp-spell
      cmp_luasnip
      customVimPlugins.stylua-nvim
      direnv-vim
      fidget-nvim
      fugitive
      gitsigns-nvim
      gruvbox-material
      harpoon
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-lspconfig
      telescope-nvim
      vim-better-whitespace
      vim-commentary
      vim-nix
      vim-polyglot
      vim-surround
    ];

    extraConfig = ''
      lua require('bookest')
    '';

    extraPackages = [
      customNodePackages.bash-language-server
      pkgs.gopls
      pkgs.kotlin-language-server
      pkgs.nodePackages.pyright
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.rnix-lsp
      pkgs.rust-analyzer
      pkgs.shellcheck
      pkgs.sumneko-lua-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
