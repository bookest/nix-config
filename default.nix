let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  nix-pre-commit-hooks = import sources.pre-commit-hooks;
in {
  pre-commit-check = nix-pre-commit-hooks.run {
    src = ./.;
    hooks = {
      convco.enable = true;
      shellcheck.enable = true;
      statix = {
        enable = true;
        settings = {
          ignore = [
            "node-env.nix"
            "sources.nix"
          ];
        };
      };
      stylua.enable = true;
    };
  };
}
