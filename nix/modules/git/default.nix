{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Christopher Grim";
    userEmail = "christopher.grim@gmail.com";
    aliases = {
      amend = "commit --amend";
      ci = "commit";
      co = "checkout";
      diffc = "diff --cached";
      st = "status --short";
    };
    extraConfig = {
      init.defaultBranch = "main";
      branch.sort = "-committerdate";
    };
    ignores = [
      ".direnv"
      ".envrc"
    ];
    delta = {
      enable = true;
      options = {
        hunk-header-style = "omit";
        hyperlinks = true;
        line-numbers = true;
        navigate = true;
      };
    };
  };

  programs.gh.enable = true;

  home.packages = [
    pkgs.gibo
  ];
}
