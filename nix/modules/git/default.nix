{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Christopher Grim";
    userEmail = "christopher.grim@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      diffc = "diff --cached";
      st = "status --short";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
    ignores = [
      ".envrc"
    ];
  };

  programs.gh.enable = true;
}
