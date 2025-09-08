{
  pkgs,
  lib,
  ...
}: {
  security = {
    polkit = {
      enable = true;
      package = pkgs.polkit;
    };
    pam.services.greetd.enableGnomeKeyring = lib.mkForce false;
  };
  services = {
    gnome.gnome-keyring.enable = lib.mkForce false;
    passSecretService.enable = true;
  };
  # systemd.user.services."keepassxc-secret-service" = {
  #   description = "KeePassXC Secret Service";
  #   wantedBy = ["default.target"]; # reliable user target
  #   after = ["dbus.service"];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.keepassxc}/bin/keepassxc --no-window --secret-service";
  #     Restart = "on-failure";
  #     TimeoutStopSec = 5;
  #     Environment = ["XDG_SESSION_TYPE=wayland"]; # optional; usually not needed
  #   };
  # };
}
