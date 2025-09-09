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
    # https://discourse.nixos.org/t/how-to-remove-xdg-desktop-portal-gtk-where-does-it-come-from-and-why/62958
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
