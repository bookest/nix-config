{ config, pkgs, ... }:

{
  home.username = "grim";
  home.homeDirectory = "/Users/grim";

  home.stateVersion = "22.05";

  imports = [
    ./modules/neovim
  ];

  home.packages = [
    pkgs.bottom
    pkgs.fd
    pkgs.ripgrep
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      style = "plain";
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      "g" = "git";
      "v" = "nvim";
    };
  };
}
