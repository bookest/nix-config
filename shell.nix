let
  sources = import ./nix/sources.nix;
  nixpkgs = sources.nixpkgs;
  pkgs = import nixpkgs { };
in
pkgs.mkShell {
  buildInputs = [
    (import sources.home-manager { inherit pkgs; }).home-manager
    pkgs.luaPackages.luacheck
    pkgs.niv
    pkgs.stylua
  ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:home-manager=${sources."home-manager"}"
  '';
}
