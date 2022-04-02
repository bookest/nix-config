{ pkgs }:

{
  tmx-attach = pkgs.writeShellApplication {
    name = "tmx-attach";
    runtimeInputs = [
      pkgs.tmux
    ];
    text = builtins.readFile (./. + "/scripts/tmx-attach.sh");
  };
}
