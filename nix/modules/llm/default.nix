{ config, pkgs, ... }:

let
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
}
