{...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings.gestures = {
    dnd-edge-view-scroll = {
      delay-ms = 250;
      trigger-width = 100;
    };
    dnd-edge-workspace-switch = {
      delay-ms = 250;
      trigger-height = 50;
    };
    hot-corners.enable = true;
  };
}
