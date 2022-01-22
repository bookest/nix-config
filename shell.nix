{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.luaPackages.luacheck
    pkgs.stylua
  ];
}

