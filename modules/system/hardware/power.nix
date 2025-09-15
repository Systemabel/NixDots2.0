{...}: {
  services = {
    upower.enable = true; # UPower service
    power-profiles-daemon.enable = true;
  }; # Power profiles
}
