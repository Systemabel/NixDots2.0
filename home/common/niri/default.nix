{pkgs, ...}: let
  niri = pkgs.niri-unstable;
in {
  imports = [
    ./binds.nix
    ./env.nix
    ./exec.nix
    ./gestures.nix
    # ./rules.nix
    ./input.nix
    ./style.nix
    ./video.nix
  ];
}
