{pkgs, ...}: {
  xdg = {
    portal = {
      extraPortals = with pkgs; [
        xdg-desktop-portal-termfilechooser
      ];
      config = {
        common = {
          "org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
        };
      };
    };
  };
}
