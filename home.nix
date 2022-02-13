{ config, pkgs, ... }:

{
  home.username = "grim";
  home.homeDirectory = "/Users/grim";
  home.stateVersion = "22.05";

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
