{ pkgs, ... }:

{
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
}
