let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  nix-pre-commit-hooks = import sources.pre-commit-hooks;
in {
  pre-commit-check = nix-pre-commit-hooks.run {
    src = ./.;
    hooks = {
      shellcheck.enable = true;
      statix.enable = true;
      stylua.enable = true;
    };
    settings.statix.ignore = [
      "node-env.nix"
      "sources.nix"
    ];
  };
}
