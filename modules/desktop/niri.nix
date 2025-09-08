{
  pkgs,
  inputs,
  ...
}: {
  # nixpkgs.overlays = [inputs.niri.overlays.niri]; # This overlay, for whatever reason, always quits with an error during nix compiling.
  programs.niri = {
    # package = pkgs.niri;
    enable = true;
  };
}
