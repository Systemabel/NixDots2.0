{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # nixpkgs.overlays = [inputs.niri-git.overlays.niri];
  programs.niri = {
    enable = lib.mkDefault true;
    # package = pkgs.niri-unstable;
    package = pkgs.niri;
  };

  services.xserver = {
    enable = lib.mkDefault true;
  };
}
