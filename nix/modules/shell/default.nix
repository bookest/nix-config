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
      localVariables = {
        ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX="YES";
      };
      envExtra = ''
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      . '/nix/var/nix/profiles/default/etc/profile.d/nix.sh'
      '' ;
      plugins = [
        {
          name = "iterm2_shell_integration";
          src = pkgs.fetchurl {
            url = "https://iterm2.com/shell_integration/zsh";
            sha256 = "sha256-Cq8winA/tcnnVblDTW2n1k/olN3DONEfXrzYNkufZvY";
          };
        }
      ];
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
