{
  pkgs ? import <nixpkgs> { inherit system; },
  system ? builtins.currentSystem,
}:

{
  stylua-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "stylua-nvim";
    version = "2022-05-05";
    src = pkgs.fetchFromGitHub {
      owner = "ckipp01";
      repo = "stylua-nvim";
      rev = "ce59a353f02938cba3e0285e662fcd3901cd270f";
      sha256 = "sha256-GfqzyJTpwrh1NZqA7rVQ8TW6CYQL7F0/lUjZL5wZyeI=";
    };
  };

  vim-jjdescription = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-jjdescription";
    version = "2024-04-06";
    src = pkgs.fetchFromGitHub {
      owner = "avm99963";
      repo = "vim-jjdescription";
      rev = "c9bf9f849ead3961ae38ab33f68306996e64c6e8";
      # Enable deep cloning as we get a 404 trying to download the archive of
      # this rev from GitHub.
      deepClone = true;
      sha256 = "sha256-NYtKTT9mUywnWI9z7B3Vlp7raANcIDHr0nWPxUBF0ug=";
    };
  };
}
