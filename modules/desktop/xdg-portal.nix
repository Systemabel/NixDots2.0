{
  pkgs,
  lib,
  config,
  ...
}: {
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
    };
    xdgOpenUsePortal = true;
    extraPortals = pkgs.lib.mkForce [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = ["kde"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr" "kde"];
        "org.freedesktop.impl.portal.Screencast" = ["wlr" "kde"];
      };
    };
  };
}
