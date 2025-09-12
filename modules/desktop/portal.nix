{
  pkgs,
  lib,
  ...
}: {
  services.dbus.enable = true;
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # https://discourse.nixos.org/t/how-to-remove-xdg-desktop-portal-gtk-where-does-it-come-from-and-why/62958
    extraPortals = with pkgs;
      lib.mkForce [
        kdePackages.xdg-desktop-portal-kde
        # xdg-desktop-portal-wlr # this apparently conflicts with wlr.enable = true
      ];
    wlr.enable = true;
    config = {
      niri = {
        default = ["kde"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr" "kde"];
        "org.freedesktop.impl.portal.Screencast" = ["wlr" "kde"];
        "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        "org.freedesktop.impl.portal.Secret" = ["keepassxc"];
      };
      common = {
        default = ["kde"];
        "org.freedesktop.impl.portal.Screenshot" = ["wlr" "kde"];
        "org.freedesktop.impl.portal.Screencast" = ["wlr" "kde"];
        "org.freedesktop.impl.FileChooser" = ["kde"];
        "org.freedesktop.impl.portal.Secret" = ["keepassxc"];
      };
    };
  };
}
