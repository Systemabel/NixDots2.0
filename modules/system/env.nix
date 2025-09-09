{...}: {
  environment.sessionVariables = {
    # XDG_CACHE_HOME = "/var/cache/$USER";
    NIXOS_OZONE_WL = "1";
    # QT_QPA_PLATFORMTHEME = "gtk3";
    # QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    # WAYLAND_DISPLAY = "wayland-1";
  };
  # systemd.tmpfiles.rules = [
  ##dir path        attr owner group age
  # "d /var/cache/%u 0700  %u    %u    -"
  # ];
}
