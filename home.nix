{ config, pkgs, ... }:

{
  home.username = "grim";
  home.homeDirectory = "/Users/grim";

  home.stateVersion = "22.05";

  imports = [
    ./modules/neovim
    ./modules/shell
  ];

  home.packages = [
    pkgs.lorri
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    prefix = "C-t";
    terminal = "screen-256color";
  };
}
