{ config, pkgs, lib, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
in
{
  home.packages = [
    pkgs.fzf
  ] ++ lib.optional isDarwin pkgs.reattach-to-user-namespace;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    prefix = "C-t";
    terminal = "screen-256color";
    plugins = [
      pkgs.tmuxPlugins.gruvbox
    ];
  };
}
