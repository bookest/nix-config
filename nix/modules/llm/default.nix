{ config, pkgs, lib, ... }:

let
  inherit (lib.generators) toJSON;

  llm-python = pkgs.python3.withPackages (py: [
    py.llm
    py.llm-ollama
  ]);
in
{
  programs.pi-coding-agent = {
    enable = true;
    extraPackages = [
      pkgs.nodejs
      pkgs.bun
    ];
    models = {
      providers = {
        ollama = {
          api = "openai-completions";
          apiKey = "ollama";
          baseUrl = "http://localhost:11434/v1";
          models = [
            {
              id = "qwen3.5:9b-mlx";
            }
          ];
        };
      };
    };
  };

  home.packages = [
    llm-python
    pkgs.beads
    pkgs.gemini-cli
    pkgs.ollama
  ];

  home.file.".gemini/settings.json".text = toJSON {} {
    general = {
      preferredEditor = "vim";
    };
    security = {
      auth = {
        selectedType = "oauth-personal";
      };
    };
    ui = {
      theme = "ANSI";
    };
  };
}
