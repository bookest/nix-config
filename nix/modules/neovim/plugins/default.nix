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
}
