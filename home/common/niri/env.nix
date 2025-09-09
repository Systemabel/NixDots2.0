{...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings.environment = {
    DISPLAY = ":0";
    QT_QPA_PLATFORM = "wayland";
    qsConfig = "";
    ELECTRO_OZONE_PLATFORM_HINT = "auto";
    TERMINAL = "ghostty";
  };
}
