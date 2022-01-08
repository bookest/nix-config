{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = [
    pkgs.gopls
    pkgs.nodePackages.bash-language-server
    pkgs.nodePackages.pyright
    pkgs.nodePackages.typescript-language-server
    pkgs.rnix-lsp
    pkgs.sumneko-lua-language-server
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      fugitive
      gitsigns-nvim
      gruvbox
      nvim-lspconfig
      telescope-nvim
      vim-nix
      vim-polyglot
    ];

    extraConfig = ''
      lua require "_init"
    '';
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
