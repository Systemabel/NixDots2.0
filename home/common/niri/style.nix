{...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings = {
    cursor = {
      hide-when-typing = false;
      hide-after-inactive-ms = null;
      size = 24;
      theme = "default";
    };
    layout = {
      gaps = 16;
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      }; # like gaps, but only from the edges f the screen. can be appended with .left, .right, .top, or .bottom
      center-focused-column = "never";
      always-center-single-column = true;
      empty-workspace-above-first = true;
      default-column-display = "normal"; # or tabbed
      default-column-width = {};
      preset-column-widths = [
        {proportion = 1. / 3.;}
        {proportion = 1. / 2.;}
        {proportion = 2. / 3.;}
        {fixed = 3440;}
      ];
      preset-window-heights = [
        {proportion = 1. / 3.;}
        {proportion = 1. / 2.;}
        {proportion = 2. / 3.;}
        {fixed = 1440;}
      ];
      tab-indicator = {
        enable = true;
        corner-radius = 12; # in pixels, floating point number or integer
        gap = 5; # in pixels, floating or integer
        gaps-between-tabs = 0;
        hide-when-single-tab = true;
        # total-proportion = 0.5;
        place-within-column = false;
        # position = ;
        # width = ;
        # active
        # inactive = ;
        # urgent = ;
      };
      # background-color = "";
      border = {
        enable = true;
        width = 1;
        # active = "#d2c973";
        # inactive = "#cdc7a3";
        # urgent = "#9b0000";
        # to demonstrate other methods:
        # urgent.color = "rgb(255 0 0)"
        # urgent.color = "#COFFEE"
        # urgent.color = "sandybrown" # basically any css color input
        # urgent.gradient = ''from="#505050" to="#a33" angle=45''
      };
      focus-ring = {
        enable = true;
        width = 3;
        # active = "#666014";
        # inactive = "";
        # urgent = "#9b0000";
      };
      shadow = {
        enable = true;
        # color = "#00000070";
        # inactive-color = #00000054;
        offset.x = 0;
        offset.y = 0;
        softness = 15;
        spread = 5;
      };
      insert-hint = {
        enable = true;
        # display = "";
      };
    };
    # there are a ton of animation settings if you really wanted to get into the weeds... check out the link at the top for all your options.
  };
}
