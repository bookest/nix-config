{ config, pkgs, ... }:

{
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
      set nocompatible
      colorscheme gruvbox
      set relativenumber
      set number
      set scrolloff=7
    '';
  };
}
