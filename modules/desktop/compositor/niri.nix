{
  pkgs,
  inputs,
  lib,
  ...
}: {
  nixpkgs.overlays = [inputs.niri-git.overlays.niri];
  programs.niri = {
    enable = lib.mkDefault true;
    package = pkgs.niri-unstable;
  };

  services.xserver = {
    enable = lib.mkDefault true;
  };
}
