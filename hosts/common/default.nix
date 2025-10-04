# hosts/common/default.nix
# Common configuration for all hosts
{
  lib,
  inputs,
  outputs,
  ...
}: {
  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp";
  imports = [
    ../../modules
    ../../users
  ];
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # gc is garbage collect :)
    gc = {
      automatic = false;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    # I got tired of warnings about /etc/nix path var so,
    channel.enable = false;
    registry =
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  };
}
