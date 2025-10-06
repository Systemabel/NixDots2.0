{lib, ...}: {
  environment = {
    # variables =
    #   lib.mkDefault {
    #   };
    sessionVariables = lib.mkDefault {
      # Wayland settings
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";

      # WAYLAND_DISPLAY = "wayland-1";
      # Defaults
      TERM = "ghostty";
      BROWSER = "firefox";
      EDITOR = "nano";

      # Setting config location variables:
      # XDG_CONFIG_HOME = "/home/";
      # ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    };
  };
}
