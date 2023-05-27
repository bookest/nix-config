#! /bin/bash

nix-shell \
  --packages nodePackages.node2nix \
  --command "node2nix -i ./node-packages.json -o node-packages.nix --nodejs-18"
