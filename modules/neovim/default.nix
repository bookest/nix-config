{ config, pkgs, ... }:

{
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
      fugitive
      gitsigns-nvim
      gruvbox-material
      lualine-nvim
      luasnip
      nvim-cmp
      nvim-lspconfig
      telescope-nvim
      vim-nix
      vim-polyglot
    ];

    extraConfig = ''
      lua require "_init"
    '';

    extraPackages = [
      pkgs.gopls
      pkgs.nodePackages.bash-language-server
      pkgs.nodePackages.pyright
      pkgs.nodePackages.typescript-language-server
      pkgs.rnix-lsp
      pkgs.sumneko-lua-language-server
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
