{ config, pkgs, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Christopher Grim";
        email = "christopher.grim@gmail.com";
      };
      ui.default-command = "log";
      ui.editor = "nvim";
    };
  };
}
