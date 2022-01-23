{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bottom
    pkgs.fd
    pkgs.ripgrep
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      style = "plain";
    };
  };

  programs.direnv.enable = true;

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      format = pkgs.lib.concatStrings [
        "$time " 
        "<"
        "$username"
        "@"
        "$hostname"
        ":"
        "$directory"
        "> "
        "$git_branch"
        "$git_state"
        "$fill"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
      character = {
        success_symbol = ''[\$](bold green)'';
        error_symbol = ''[\$](bold red)'';
      };
      cmd_duration = {
        format = ''[\[$duration\]]($style)'';
      };
      directory = {
        truncate_to_repo = false;
        format = ''[$path]($style)'';
      };
      fill = { 
        symbol = " ";
      };
      git_branch = {
        format = ''[\($branch\)]($style)'';
      };
      time = {
        disabled = false;
        format = ''[\[$time\]]($style)'';
        style = "blue"; 
      };
      username = {
        format = ''[$user]($style)'';
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = ''[$hostname]($style)'';
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      "g" = "git";
      "hm" = "home-manager";
      "v" = "nvim";
    };
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
