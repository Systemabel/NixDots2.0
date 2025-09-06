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
  };
  systemd.user.services."keepassxc-autostart" = {
    description = "KeePassXC (Secret Service) autostart";
    wantedBy = ["default.target"]; # reliable user target
    after = ["dbus.service"];
    serviceConfig = {
      ExecStart = "${pkgs.keepassxc}/bin/keepassxc --minimized";
      Restart = "on-abort";
      # Environment = [ "XDG_SESSION_TYPE=wayland" ];  # optional; usually not needed
    };
  };
}
