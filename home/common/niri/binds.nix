{config, ...}: {
  # See here for all options: https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettings
  programs.niri.settings.binds = with config.lib.niri.actions; let
    sh = spawn "sh" "-c";
  in {
    ##** example; **
    # "Print".action = sh ''grim -g "$(slurp)" - | wl-copy'';

    ## ** Accessibility **
    "mod+slash".action = show-hotkey-overlay;
    "super+alt+S" = {
      action = sh "pkill orca || exec orca";
      hotkey-overlay.title = "Text-to-voice";
    };
    ## ** Workspaces **
    #     // There are way too many ways to do the same thing *Sigh*
    #     // These are organized typically by input group, as opposed to
    #     // output. Hopefully that makes most sense. Learn a group to
    #     // start using that group and getting used to it.
    #     //
    #     // ** Note: I commented out some mouse-scoll commands because
    #     // a) I use a trackpad, and
    #     // b) When I use a physical mouse, it has horizontal scoll
    #     // ALSO!!
    #     // ** I use the colemak-DH layout (+layers), so if you want
    #     // the same layout for a qwerty setup, change everyting under
    #     // "Workspaces" like this:
    #     //
    #     // Colemak-DH:  Qwerty:
    #     // J    --->    Y
    #     // M    --->    H
    #     // K    --->    N
    #     // H    --->    M
    #     // U    --->    I
    #     // E    --->    K
    #     // N    --->    J
    #     // I    --->    L
    #     // L    --->    U
    #     // Y    --->    O
    "mod+O" = {
      action = toggle-overview;
      repeat = false;
    };
    ## ** Focus **
    "mod+tab".action = focus-workspace-previous;

    "mod+up".action = focus-window-or-workspace-up;
    "mod+down".action = focus-window-or-workspace-down;
    "mod+left".action = focus-column-left;
    "mod+right".action = focus-column-right;
    "mod+U".action = focus-window-or-workspace-up;
    "mod+E".action = focus-window-or-workspace-down;
    "mod+N".action = focus-column-left;
    "mod+I".action = focus-column-right;
    "mod+1".action.focus-workspace = "1";
    "mod+2".action.focus-workspace = "2";
    "mod+3".action.focus-workspace = "3";
    "mod+4".action.focus-workspace = "4";
    "mod+5".action.focus-workspace = "5";
    "mod+6".action.focus-workspace = "6";
    "mod+7".action.focus-workspace = "7";
    "mod+8".action.focus-workspace = "8";
    "mod+9".action.focus-workspace = "9";

    # Move Window (and columns)
    "super+alt+up".action = move-window-up-or-to-workspace-up;
    "super+alt+down".action = move-window-down-or-to-workspace-down;
    "super+alt+left".action = move-column-left;
    "super+alt+right".action = move-column-right;
    "super+alt+U".action = move-window-up-or-to-workspace-up;
    "super+alt+E".action = move-window-down-or-to-workspace-down;
    "super+alt+N".action = move-column-left;
    "super+alt+I".action = move-column-right;
    "super+alt+ctrl+up".action = move-column-to-workspace-up;
    "super+alt+ctrl+down".action = move-column-to-workspace-down;
    "super+alt+home".action = move-column-to-first;
    "super+alt+end".action = move-column-to-last;
    "super+alt+ctrl+U".action = move-window-up-or-to-workspace-up;
    "super+alt+ctrl+E".action = move-window-down-or-to-workspace-down;
    "super+alt+1".action.move-window-to-workspace = "1";
    "super+alt+2".action.move-window-to-workspace = "2";
    "super+alt+3".action.move-window-to-workspace = "3";
    "super+alt+4".action.move-window-to-workspace = "4";
    "super+alt+5".action.move-window-to-workspace = "5";
    "super+alt+6".action.move-window-to-workspace = "6";
    "super+alt+7".action.move-window-to-workspace = "7";
    "super+alt+8".action.move-window-to-workspace = "8";
    "super+alt+9".action.move-window-to-workspace = "9";
    "super+alt+ctrl+1".action.move-window-to-workspace = "2";
    "super+alt+ctrl+2".action.move-window-to-workspace = "1";
    "super+alt+ctrl+3".action.move-window-to-workspace = "3";
    "super+alt+ctrl+4".action.move-window-to-workspace = "4";
    "super+alt+ctrl+5".action.move-window-to-workspace = "5";
    "super+alt+ctrl+6".action.move-window-to-workspace = "6";
    "super+alt+ctrl+7".action.move-window-to-workspace = "7";
    "super+alt+ctrl+8".action.move-window-to-workspace = "8";
    "super+alt+ctrl+9".action.move-window-to-workspace = "9";
    # Move Workspace
    "mod+ctrl+page_up".action = move-workspace-up;
    "mod+ctrl+page_down".action = move-workspace-down;
    # Multi-monitor: (I only have a single monitor - figure these out however makes sense to you)
    # "Mod+Ctrl+Left"  = focus-monitor-left;
    # "Mod+Ctrl+Down"  = focus-monitor-down;
    # "Mod+Ctrl+Up"    = focus-monitor-up;
    # "Mod+Ctrl+Right" = focus-monitor-right;
    # "Mod+Ctrl+H" = focus-monitor-left;
    # "Mod+Ctrl+J" = focus-monitor-down;
    # "Mod+Ctrl+K" = focus-monitor-up;
    # "Mod+Ctrl+L" = focus-monitor-right;
    # "Super+Alt+Ctrl+Left"  = move-column-to-monitor-left;
    # "Super+Alt+Ctrl+Down"  = move-column-to-monitor-down;
    # "Super+Alt+Ctrl+Up"    = move-column-to-monitor-up;
    # "Super+Alt+Ctrl+Right" = move-column-to-monitor-right;
    # "Super+Alt+Ctrl+H" = move-column-to-monitor-left;
    # "Super+Alt+Ctrl+J" = move-column-to-monitor-down;
    # "Super+Alt+Ctrl+K" = move-column-to-monitor-up;
    # "Super+Alt+Ctrl+L" = move-column-to-monitor-right;
    # "Mod+Shift+Ctrl+Left" = move-window-to-monitor-left;

    # I don't even know what these do... check the wiki
    # "mod+space".action.switch-layout = "next";
    # "mod+ctrl+space".action.switch-layout = "prev";

    # Window Adjustments
    "mod+Q".action = close-window;
    "alt+f4".action = close-window;
    "super+alt+C".action = center-column;
    "super+ctrl+C".action = center-visible-columns;
    "mod+comma".action.set-column-width = "-10%";
    "mod+period".action.set-column-width = "+10%";
    "super+alt+R".action = switch-preset-column-width;
    "mod+ctrl+R".action = reset-window-height;
    "super+alt+F".action = maximize-column;
    "mod+F".action = fullscreen-window;
    "mod+ctrl+F".action = expand-column-to-available-width;
    "mod+shift+M".action = consume-or-expel-window-left;
    "mod+shift+O".action = consume-or-expel-window-right;
    "mod+K".action = toggle-column-tabbed-display;
    "mod+space".action = toggle-window-floating;
    # Finer width adjustments:
    # "".action.set-width-in-pixels = "1000"
    # * adjust width in pixels: "-5" or "+5"
    # * set width as a percentage of screen width: "25%"
    # * adjust width as a percentage of screen width: "-10%" or "+10%"
    # Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
    # set-column-width "100" will make the column occupy 200 physical screen pixels.

    # Session
    "mod+escape" = {
      action = sh "";
      hotkey-overlay.title = "Power menu";
    };
    "ctrl+alt+delete" = {
      action = sh "btop";
      hotkey-overlay.title = "Task Manager (btop)";
    };
    "super+alt+escape" = {
      action = sh "loginctl lock-session";
      hotkey-overlay.title = "Lockscreen";
    };
    "super+ctrl+escape" = {
      action = quit;
      hotkey-overlay.title = "Logout";
    };
    "ctrl+alt+super+escape" = {
      action = sh "systemctl suspend";
      hotkey-overlay.title = "Sleep";
    };
    "ctrl+alt+super+shift+escape" = {
      action = sh "systemctl hibernate";
      hotkey-overlay.title = "Hibernate";
    };
    "ctrl+alt+super+shift+delete" = {
      action = sh "systemctl poweroff";
      hotkey-overlay.title = "Shut Down";
    };
    #     // Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

    # Display
    # For brightness, see system/display.nix for setting up ddcutil & i2c driver!
    "XF86MonBrightnessUp" = {
      action = sh "ddcutil -b 6 setvcp 10 + 10";
      cooldown-ms = 300;
    };
    "XF86MonBrightnessDown" = {
      action = sh "ddcutil -b 6 setvcp 10 - 10";
      cooldown-ms = 300;
    };
    # "print".action = screenshot;
    # "ctrl+print".action = screenshot-screen;
    # "alt+print".action = screenshot-window;

    # Audio/Media controls
    "XF86AudioRaiseVolume" = {
      action = sh "spctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action = sh "spctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action = sh "spctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      allow-when-locked = true;
    };
    # # ** I don't have a mute button on my keyboard, and I use an external audio interface anyway...
    # "XF86AudioMute" = {
    #   action = sh "spctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    #   allow-when-locked = true;
    # };
    "XF86AudioPlay" = {
      action = sh "playerctl play-pause";
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action = sh "playerctl next";
      allow-when-locked = true;
    }; #     // bindl= ,XF86AudioNext, exec, playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"` # [hidden]
    "XF86AudioPrev" = {
      action = sh "playerctl previous";
      allow-when-locked = true;
    };

    # # ** System
    "mod+return" = {
      action.spawn = "anyrun";
      hotkey-overlay.title = "Anyrun";
    };
    # // System
    #     Mod+Return repeat=false hotkey-overlay-title="Application Launcher" {spawn-sh "qs -c noctalia-shell ipc call launcher toggle";}
    #     Mod+V hotkey-overlay-title="Clipboard Manager" {spawn-sh "qs -c dms ipc call clipboard toggle";}
    #     Mod+Delete hotkey-overlay-title="Task Manager" {spawn-sh "qs -c dms ipc call processlist toggle";}
    #     Mod+N hotkey-overlay-title="Notification Center" {spawn-sh "qs -c dms ipc call notifications toggle";}
    #     Mod+I hotkey-overlay-title="Settings" {spawn-sh "qs -c noctalia-shell ipc call settings toggle";}
    #     Mod+Ctrl+Escape hotkey-overlay-title="Open Task Manager: btop" { spawn-sh "$TERM -e btop"; }
    #     Super+Alt+Ctrl+Shift+R {spawn-sh "killall qs quickshell; qs -c $qsConfig &";}
    #     Super+C {spawn-sh "qs -c noctalia-shell ipc call launcher clipboard";}

    # # ** Other Apps
    "mod+W" = {
      action.spawn = "firefox";
      hotkey-overlay.title = "Launch Web-browser";
    };
    "mod+B" = {
      action.spawn = "dolphin";
      hotkey-overlay.title = "Launch file-Browser (dolphin)";
    };
    "mod+T" = {
      action.spawn = "ghostty";
      hotkey-overlay.title = "Launch Terminal (ghostty)";
    };
    "mod+C" = {
      action.spawn = "codium";
      hotkey-overlay.title = "Launch vsCode";
    };
    "mod+X" = {
      action.spawn = "kate";
      hotkey-overlay.title = "Launch text-editor (Kate)";
    };
    "mod+S" = {
      action.spawn = "spotify";
      hotkey-overlay.title = "Launch Spotify";
    };
    "mod+ctrl+S" = {
      action = sh "spicetify apply";
    };
    # // Other Apps
    #     // Remember to compare with End-4's "first-available" commands!
    #     Mod+T hotkey-overlay-title="Open Terminal: ghostty" { spawn "ghostty"; }
    #     Mod+Ctrl+T hotkey-overlay-title="Open Terminal: kitty" { spawn "kitty"; }
    #     Super+Alt+T hotkey-overlay-title="Open Terminal: alacritty" { spawn "alacritty"; }
    #     Mod+E hotkey-overlay-title="Open File Browser" { spawn "dolphin"; }
    #     Mod+W hotkey-overlay-title="Open Browser" { spawn "zen-browser"; }
    #     // Mod+C hotkey-overlay-title="Open Code Editor: codium" { spawn "codium"; }
    #     Mod+X hotkey-overlay-title="Open Text Editor" { spawn "gnome-text-editor"; }
    #     Mod+Ctrl+V hotkey-overlay-title="Open Volume Mixer" { spawn "pavucontrol"; }
    #     Mod+S hotkey-overlay-title="Open Spotify" { spawn "spotify"; }

    # // Unused
    # // qs -c dms ipc call audio setvolume 50
    # // qs -c dms ipc call audio mute
    # // qs -c dms ipc call spotlight toggle
    # // qs -c dms ipc call notepad toggle
    # // qs -c dms ipc call processlist toggle
    # // qs -c dms ipc call powermenu toggle    // qs -c dms ipc call wallpaper set /path/to/image.jpg
    # // qs -c dms ipc call theme toggle
    # // qs -c dms ipc call night toggle
    # // qs -c dms ipc call lock lock
    # // qs -c dms ipc call mpris playPause
    # // qs -c dms ipc call mpris next
  };
}
