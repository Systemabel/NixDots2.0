{pkgs, ...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./impermanence.nix
    ./networking.nix
    ./zram.nix
  ];
  # programs.niri = {
  # enable = true;
  # xwayland.enable = true;
  # };
  # serivices.libinput.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    tree
    bat
    git
    fastfetch
    btop
    htop
    ghostty
    # kdePackages.kate
    # vscodium
    # xdg-desktop-portal
    # alacritty
    # fuzzel
    # hyprlock
    # mako
    # hypridle
  ];

  # security.polkit.enable = true; # polkit
  # services.gnome.gnome-keyring.enable = true; # secret service
  # security.pam.services.swaylock = {};

  # programs.waybar.enable = true; # top bar
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
