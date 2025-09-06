{...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./impermanence.nix
    ./networking.nix
    ./security.nix
    ./zram.nix
  ];
  # serivices.libinput.enable = true;

  # security.polkit.enable = true; # polkit
  # services.gnome.gnome-keyring.enable = true; # secret service
  # security.pam.services.swaylock = {};

  # programs.waybar.enable = true; # top bar
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
