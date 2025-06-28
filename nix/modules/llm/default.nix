{ config, pkgs, lib, ... }:

let
  inherit (lib.generators) toJSON;

  llm-python = pkgs.python3.withPackages (py: [
    py.llm
    py.llm-ollama
  ]);
in
{
  home.packages = [
    llm-python
    pkgs.gemini-cli
    pkgs.ollama
  ];

  home.file.".gemini/settings.json".text = toJSON {} {
    theme = "ANSI";
    selectedAuthType = "oauth-personal";
    preferredEditor = "vim";
  };
}
