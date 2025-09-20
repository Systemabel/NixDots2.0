{lib, ...}: {
  environment.sessionVariables = lib.mkDefault {
    # Wayland settings
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";

    # WAYLAND_DISPLAY = "wayland-1";
    TERM = "ghostty";
    BROWSER = "firefox";
  };
}
