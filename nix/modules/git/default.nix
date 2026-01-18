{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
      ".envrc"
    ];
    settings = {
      user.name = "Christopher Grim";
      user.email = "christopher.grim@gmail.com";
      alias = {
        amend = "commit --amend";
        ci = "commit";
        co = "checkout";
        diffc = "diff --cached";
        st = "status --short";
      };
      init.defaultBranch = "main";
      branch.sort = "-committerdate";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      hunk-header-style = "omit";
      hyperlinks = true;
      line-numbers = true;
      navigate = true;
    };
  };

  programs.gh.enable = true;

  xdg.configFile."git/hooks".source = ./scripts/hooks;

  home.packages = [
    pkgs.gibo
  ];
}
