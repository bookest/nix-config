{ config, pkgs, lib, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
  scripts = import ./scripts.nix { inherit pkgs; };
in
{
  home.packages = [
    pkgs.btop
    pkgs.fzf
    scripts.tmx-attach
  ] ++ lib.optional isDarwin pkgs.reattach-to-user-namespace;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 10;
    keyMode = "vi";
    prefix = "C-t";
    terminal = "screen-256color";
    plugins = [
      pkgs.tmuxPlugins.gruvbox
    ];
    extraConfig = ''
      set -g allow-passthrough on
      set -g set-clipboard on

      set-option -sa terminal-overrides ',xterm-256color:RGB'

      unbind %
      unbind '"'
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"

      unbind t
      bind t display-popup -h 80% -w 80% -E btop
    '';
  };
}
