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
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        extraOptions = {
          AddKeysToAgent = "yes";
          UseKeychain = "yes";
          ForwardAgent = "yes";
          IdentitiesOnly = "yes";
          SendEnv = "LANG LC_*";
        };
      };
    };
  };
}
