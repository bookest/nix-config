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

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      style = "plain";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.starship = {
    enable = true;
    inherit (starship) settings;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
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
      . "${config.home.profileDirectory}/etc/profile.d/nix.sh"
      . "${config.home.profileDirectory}/etc/profile.d/nix-daemon.sh"
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [
        "-p 80%"
      ];
    };
  };
}
