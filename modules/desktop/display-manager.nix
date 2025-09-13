{
  pkgs,
  config,
  ...
}: {
  # environment.systemPackages = with pkgs; [];
  # TODO get this themed
  # TODO allow numlock, please
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.numlockx}/bin/numlockx on && ${pkgs.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };
  programs.regreet = {
    # any of theme, font, iconTheme or cursorTheme will also accept a package =   argument.
    enable = true;
    # theme = {
    #   name = "Adwaita";
    # };
    # font = {
    #   size = 16;
    #   name = "Roboto";
    # };
    # iconTheme = {
    #   name = "Papirus";
    # };
    # cursorTheme = {
    #   name = "Adwaita";
    # };
    # extraCss = "${config.users.users.orca.home}/.config/greetd/regreet.css";
    # settings = {
    #   background = {
    #     path = "${config.users.users.orca.home}/Pictures/Wallpapers/cityscape.jbg";
    #     fit = "Fill";
    #   };
  };

  # settings = {
  #   background = {
  #     path = "/usr/share/backgrounds/greeter.jpg";
  #     fit = "Contain"; #Fill, Contain, Cover, ScaleDown - https://docs.gtk.org/gtk4/enum.ContentFit.html
  #   };
  #   env = {
  #     # ENV_VARIABLE = "value";
  #   };
  #   GTK = {
  #     application_prefer_dark_theme = true;
  #     cursor-theme-name = "Adwaita";
  #     font_name = "Cantarell 16";
  #     icon_theme_name = "Adwaita";
  #     theme_name = "Adwaita";
  #   };
  #   commands = {
  #     reboot = ["systemctl" "reboot"];
  #     poweroff = ["systemctl" "poweroff"];
  #     x11_prefix = ["startx" "/usr/bin/env"];
  #   };
  #   appearance = {
  #     greeting_msg = "Welcome back!";
  #   };
  #   widget.clock = {
  #     # strftime format argument
  #     # See https://docs.rs/jiff/0.1.14/jiff/fmt/strtime/index.html#conversion-specifications
  #     format = "%a %H:%M";
  #     resolution = "500ms";
  #     timezone = "America/Chicago"; # for overriding system timezone
  #     lagel_width = 150;
  #   };
  # };
  # };
}
