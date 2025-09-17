{pkgs, ...}: {
  # programs.dconf.enable = true;
  xdg = {
    portal = {
      # https://discourse.nixos.org/t/how-to-remove-xdg-desktop-portal-gtk-where-does-it-come-from-and-why/62958
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        # this apparently conflicts with wlr.enable = true
      ];
      #   wlr.enable = true;
      config = {
        common = {
          default = ["kde"];
        };
      };
    };
  };
  environment.etc."xdg/menus/applications.menu".source =
    pkgs.kdePackages.plasma-workspace + "/etc/xdg/menus/plasma-applications.menu";
  # this ^^ line is for basically bringing the applications.menu from
  # kdePackages.plasma-workspace to the right place and allowing kbuildsycoca6 # to make proper menu indexes. (that's my best observational understanding)

  # services.dbus.packages = with pkgs; [
  #   kdePackages.xdg-desktop-portal-kde
  # ];
  # this is to fix the issue that portal-kde's .service file wasn't being added to the location it was supposed to.

  services.udisks2.enable = true;
  # this is for kio/dolphin to be allowed to mount or unmount disks/partitions .
}
