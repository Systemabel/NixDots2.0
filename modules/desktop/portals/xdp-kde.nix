{pkgs, ...}: {
  # programs.dconf.enable = true;
  xdg = {
    portal = {
      config = {
        common = {
        };
      };
    };
  };

  # services.dbus.packages = with pkgs; [
  #   kdePackages.xdg-desktop-portal-kde
  # ];
  # this is to fix the issue that portal-kde's .service file wasn't being added to the location it was supposed to.
}
