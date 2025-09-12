{lib, ...}: {
  security = {
    polkit.enable = true;
    pam.services.greetd.enableGnomeKeyring = lib.mkForce false;
  };
  services = {
    gnome.gnome-keyring.enable = lib.mkForce false;
    # passSecretService.enable = true;
  };
  # systemd.user.services."keepassxc" = {
  #   description = "KeePassXC with Secret Service";
  #   wantedBy = ["graphical-session.target"]; # Start with GUI session
  #   after = ["graphical-session.target"];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.keepassxc}/bin/keepassxc --secret-service";
  #     Restart = "on-failure";
  #     RestartSec = 5;
  #     TimeoutStopSec = 10;
  #     Environment = ["DISPLAY=:0"];
  #   };
  # };
}
