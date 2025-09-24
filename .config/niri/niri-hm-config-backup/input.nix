{...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings.input = {
    focus-follows-mouse = {
      enable = true;
      max-scroll-amount = "0%";
    };
    warp-mouse-to-focus = {
      enable = false;
    };
    mod-key = "super";
    mod-key-nested = "alt";
    keyboard = {
      numlock = true;
      repeat-delay = 250;
      repeat-rate = 40;
      track-layout = "global"; # can be set to "window" if you wanted per-window layouts
      # xkb = {
      ## these are all passed to libxkbcommon
      # layout = "us";
      # variant = "colemak_dh" # for example, or dvorak or whatever
      # options = "compose:ralt,ctrl:nocaps"
      # model = "";
      # rules = "";
      # file = "";
      # };
    };
    mouse = {
      enable = true;
      accel-profile = "adaptive";
      accel-speed = 0.2;
      left-handed = false;
      natural-scroll = false;
    };
    touchpad = {
      enable = true;
      tap = true; # this is tap-to-click
      tap-button-map = "left-right-middle"; # what button to click when 1, 2, or 3 fingers tap respectively.
      scroll-method = "two-finger"; # options: "no-scroll", "two-finger", "edge", "on-button-down"
      natural-scroll = true; # this reverses the scroll direction
      accel-profile = "adaptive";
      accel-speed = 0.2;
      click-method = "clickfinger"; # or "button-areas" to provide some context
      disabled-on-external-mouse = false;
      drag = true; # https://wayland.freedesktop.org/libinput/doc/latest/tapping.html#tap-and-drag
      dwt = false; # dwt = disable while typing
    };
  };
}
