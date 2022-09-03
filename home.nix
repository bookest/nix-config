{ config, pkgs, ... }:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
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

  nixpkgs.config = {
    allowUnsupportedSystem = true;
    allowBroken = true;
  };

  nix = {
    package =  pkgs.nix;
    settings = {
      experimental-features = "nix-command";
    };
  };
}
