{ config, pkgs, ... }:

{
  home.username = "grim";
  home.homeDirectory = "/Users/grim";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/git
    ./modules/neovim
    ./modules/shell
    ./modules/tmux
  ];

  home.packages = [
    pkgs.lorri
  ];
}
