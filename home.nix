{ config, pkgs, ... }:

{
  home = {
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";
    stateVersion = "22.05";
  };

  imports = [
    ./nix/modules/git
    ./nix/modules/ideavim
    ./nix/modules/jj
    ./nix/modules/neovim
    ./nix/modules/shell
    ./nix/modules/ssh
    ./nix/modules/tmux
    ./nix/modules/wezterm
  ];

  nixpkgs.config = {
    allowUnsupportedSystem = true;
    allowBroken = true;
  };

  nix = {
    package =  pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };
}
