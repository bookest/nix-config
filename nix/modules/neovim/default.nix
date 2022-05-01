{ config, pkgs, ... }:

let
  stylua-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "stylua-nvim";
    # TODO: Switch back to ckipp01/stylua-nvim once
    # https://github.com/ckipp01/stylua-nvim/pull/13 is merged.
    src = pkgs.fetchFromGitHub {
      owner = "bookest";
      repo = "stylua-nvim";
      rev = "47742f9294476613ae5d50d4e1031e3576963632";
      sha256 = "sha256-GfqzyJTpwrh1NZqA7rVQ8TW6CYQL7F0/lUjZL5wZyeI=";
    };
  };
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
      cmp_luasnip
      direnv-vim
      fidget-nvim
      fugitive
      gitsigns-nvim
      gruvbox-material
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-lspconfig
      stylua-nvim
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
      pkgs.gopls
      pkgs.kotlin-language-server
      pkgs.nodePackages.bash-language-server
      pkgs.nodePackages.pyright
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.rnix-lsp
      pkgs.rust-analyzer
      pkgs.sumneko-lua-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
