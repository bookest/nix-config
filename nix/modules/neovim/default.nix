{ config, pkgs, ... }:

let
  stylua-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "stylua-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ckipp01";
      repo = "stylua-nvim";
      rev = "ce59a353f02938cba3e0285e662fcd3901cd270f";
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
      harpoon
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
