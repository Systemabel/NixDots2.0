{
  pkgs,
  inputs,
  ...
}: {
  # nixpkgs.overlays = [inputs.niri.overlays.niri];
  environment.systemPackages = [
    inputs.niri.packages.${pkgs.system}.niri-unstable
    # pkgs.niri
  ];

  services.xserver = {
    enable = true;
  };
  services.displayManager.sessionPackages = [pkgs.niri];
}
