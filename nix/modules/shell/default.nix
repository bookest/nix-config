{ config, pkgs, ... }:

let
  starship = import ./starship.nix { inherit pkgs; };
  sources = import ../../sources.nix;
  comma = (import sources.comma).default;
in
{
  home.packages = [
    comma
    pkgs.bottom
    pkgs.fd
    pkgs.nix-index
    pkgs.ripgrep
    pkgs.wget
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
        style = "plain";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      inherit (starship) settings;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        "g" = "git";
        "hm" = "home-manager";
        "v" = "nvim";
      };
      envExtra = ''
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      . '/nix/var/nix/profiles/default/etc/profile.d/nix.sh'
      '' ;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux = {
        enableShellIntegration = true;
        shellIntegrationOptions = [
          "-p 80%"
        ];
      };
    };
  };
}
