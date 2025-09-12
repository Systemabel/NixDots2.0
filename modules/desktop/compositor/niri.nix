{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri-git.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  services.xserver = {
    enable = true;
  };
}
