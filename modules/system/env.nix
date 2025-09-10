{...}: {
  environment.sessionVariables = {
    # Wayland settings
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";

    # XDG Base Directory variables
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # WAYLAND_DISPLAY = "wayland-1";
    # QT_QPA_PLATFORMTHEME = "gtk3";
    # QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
  };

  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    icons.enable = true;
  };

  # systemd.tmpfiles.rules = [
  ##dir path        attr owner group age
  # "d /var/cache/%u 0700  %u    %u    -"
  # ];
}
