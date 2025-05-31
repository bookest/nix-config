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
    version = "2025-05-31";
    src = pkgs.fetchFromGitHub {
      owner = "avm99963";
      repo = "vim-jjdescription";
      rev = "c99bff42e7afff356514ae5b3f225665bf10b57c";
      sha256 = "sha256-IIiBJlGmdYntwqizUy2xB8hhBJBGa1ASK9hmN8xZEvk=";
    };
  };
}
