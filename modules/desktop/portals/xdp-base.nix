{pkgs, ...}: {
  # programs.dconf.enable = true; # enabled without setting, even though it
  # defaunts to false. check with nixos-option
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      # this apparently conflicts with wlr.enable = true
    ];
    #   wlr.enable = true;
  };
}
