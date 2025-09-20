{pkgs, ...}: {
  # programs.dconf.enable = true; # enabled without setting, even though it
  # defaunts to false. check with nixos-option
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-wlr
      # this apparently conflicts with wlr.enable = true
    ];
    config = {
      common = {
        default = ["kde"];
        "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
        "org.freedesktop.impl.portal.OpenURI" = ["termfilechooser"];
      };
    };
    #   wlr.enable = true;
  };
  environment.etc."xdg/menus/applications.menu".source =
    pkgs.kdePackages.plasma-workspace + "/etc/xdg/menus/plasma-applications.menu";
  # this ^^ line is for basically bringing the applications.menu from
  # kdePackages.plasma-workspace to the right place and allowing kbuildsycoca6 # to make proper menu indexes. (that's my best observational understanding)

  services.udisks2.enable = true;
  # this is for kio/dolphin to be allowed to mount or unmount disks/partitions
}
