{ config, pkgs, ... }:

let
  sources = import ../../sources.nix;
  # Discard string context so getFlake accepts the store path string
  herdrFlake = builtins.getFlake (builtins.unsafeDiscardStringContext "${sources.herdr}");
  system = pkgs.stdenv.hostPlatform.system;
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [
    herdrFlake.packages.${system}.default
  ];

  xdg.configFile."herdr/config.toml".source = mkOutOfStoreSymlink ./config.toml;
}
