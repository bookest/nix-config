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
      fugitive
      gruvbox
      vim-nix
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
