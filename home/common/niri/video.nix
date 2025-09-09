{...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings.outputs = {
    # you need to change "DP-1" to whatever is in the parentheses in the first
    # line of when you run "niri msg outputs" in a terminal.
    # for multi-monitor setups, copy and paste below, changing the identifier.
    "DP-1" = {
      enable = true;
      focus-at-startup = true;
      mode = {
        width = 3440;
        height = 1440;
        refresh = 144.000;
      };
      variable-refresh-rate = true; # aka vrr, adaptive sync, freesync, g-sync. check if your monitor supports this.
      position.x = 0; # change this for secondary monitors to change where they sit in comarison to the first monitor.
      position.y = 0; # for x and y, it adjusts the position of the top left corner of the screen.
      # for example, if you had two 1080p monitors side by side, the second one would have an x position of 1920 (right) or -1920 (left).
    };
  };
}
