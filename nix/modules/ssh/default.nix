{ lib, config, pkgs, ... }:

let
    inherit (pkgs) stdenv;
    inherit (lib) mkIf;
in
{
  programs.ssh = mkIf stdenv.isDarwin {
    enable = true;
    includes = [
      "~/.orbstack/ssh/config"
    ];
  };
}
