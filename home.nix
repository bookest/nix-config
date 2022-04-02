{ config, pkgs, ... }:

{
  home.username = "grim";
  home.homeDirectory = "/Users/grim";
  home.stateVersion = "22.05";

  imports = [
    ./nix/modules/git
    ./nix/modules/neovim
    ./nix/modules/shell
    ./nix/modules/tmux
  ];

  home.packages = [
    pkgs.lorri
  ];
}
