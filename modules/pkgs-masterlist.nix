{pkgs, ...}:
with pkgs; {
  environment.systemPackages = let
    hardware = [
      # note: audio: services.pipewire{ alsa, pulse, jack, wireplumber }
      brightnessctl
      ddcutil
      mesa
      vulkan-tools
      # qmk
      # note: services.nact.enable = true --> in config
    ];
    security = [
      keepassxc
      kdePackages.polkit-kde-agent-1
    ];
    system-cli-tools = [
      pciutils
      (lib.hiPrio pkgs.uutils-coreutils-noprefix) #lib.hiPrio is used to avoid potential conflict with 'coreutils-full'
      uutils-findutils
      uutils-diffutils
      usbutils
      exfatprogs
      caligula
    ];

    # ---
    compositor = [
      # niri-unstable is called in services.displayManager.sessionPackages
      xwayland-satellite
    ];
    guiShell = [
      anyrun
      cava
      clipvault
      fuzzel
      gpu-screen-recorder
      hypridle
      hyprlock
      khal
      libnotify
      mako
      mpvpaper
      niriswitcher
      playerctl
      quickshell
      rink
      sunsetr
      swww
      waytrogen
      wiremix
    ];
    kde = with kdePackages; [
      breeze
      breeze-icons
      breeze-gtk
      dolphin
      dolphin-plugins
      ffmpegthumbs
      frameworkintegration
      kate
      kde-cli-tools
      kde-gtk-config
      kded
      kdialog
      kio
      kio-admin
      kio-extras
      kio-fuse
      klevernotes
      kmime
      koko
      kservice
      kxmlgui
      partitionmanager
      plasma-integration
      plasma-workspace
      qt6ct
      qt6gtk2
      qtbase
      qtmultimedia
    ];
    dynamicTheming = [
      spicetify-cli
      adwaita-icon-theme
      gnome-themes-extra
      kde-gruvbox
      libsForQt5.qtstyleplugins
      matugen
    ];

    # ---
    userApps = [
      # TODO servo # this one is pretty broken as of right now... won't build for some reason.
      # -- check if it has to do with the zram
      firefox
      brave
      kodi-wayland
      kodiPackages.netflix
      kodiPackages.steam-library
      kodiPackages.steam-launcher
      vesktop
      mpv
    ];
    devTools = [
      vscodium
      alejandra
      direnv
      inotify-tools
      nixd
      git
      kdePackages.qtdeclarative
    ];
    flake-building-utils = [
      nix-index
      nix-search-tv
      nix-tree
      zenity
    ];
    gaming = [
      gamescope
      mangohud
      goverlay
      steamtinkerlaunch
      protonup-qt
      protonup-rs
    ];
    cli = [
      astroterm
      bat
      btop
      curl
      dragon-drop
      eza
      fastfetch
      htop
      jq
      ripgrep
      skim
      tealdeer
      translate-shell
      trash-cli
      wl-clipboard
      yazi
      yaziPlugins.smart-enter
    ];
    terminal = [
      ghostty
      kitty
      starship
    ];

    core = hardware ++ security ++ system-cli-tools;
    desktop = compositor ++ guiShell ++ kde ++ dynamicTheming;
    applications = userApps ++ devTools ++ flake-building-utils ++ gaming ++ cli ++ terminal;
  in
    core ++ desktop ++ applications;
}
# NOTE: Here's a full list of dependencies from all the referenced
# dotfiles. I'll systematically enable different packages to expand on
#features when they become necessary. Then, when everything is working
# well, I'll organize it all into the various sections all properly
# organized.
# adw-gtk-theme
# alvr
# app2unit #?
# arrpc
# axel # terminal download accelerator
# base16-schemes
# bc # calculator
# cairomm # neither do I know what this does
# cliphist # wayland clipboard manager
# clipvault # rust alt to cliphist - requires build from github
# coreutils # included by default in nixos
# darkly-bin # qt style
# dgop
# discord
# equicord
# ffmpeg
# foot
# fuzzel
# geoclue
# glib2
# gnome-themes-extra
# gpu-screen-recorder
# gtk-engine-murrine # (theme-colloid)
# gtk3
# gtk4
# gtkmm3
# gtksourceviewmm # I don't even know
# hyprpicker
# hyprshot
# imagemagick # image editing software
# inotify-tools # script tool - very helpful
# jq # command-line json processor
# kdePackager.kdialog
# kdePackages.bluedevil
# kdePackages.plasma-nm
# kdePackages.plasma5support
# kdePackages.qt5compat
# kdePackages.qt6ct
# kdePackages.systemsettings
# khal
# libdbusmenu-gtk3
# libnotify
# libsForQt5ct.qt5ct
# libva
# libva-utils
# material-symbols # in fonts.nix
# matugen
# meson # Python build system
# nerd-fonts.ttf-jetbrains-mono-nerd # fonts.nix
# nh # enabled in default.nix
# nm-connection-editor
# nodePackages.prettier
# openasar # for discord
# papirus-icon-theme # fonts-themes.nix
# pavucontrol
# pavucontrol-qt #necessary?
# playerctl
# playerctl
# pulseaudio # audio.nix
# python-aiohttp-oauthlib
# python313Packages.kde-material-you-colors
# python314
# qt6ct
# qt6ct-kde
# quickshell # quickshell.nix
# roboto # fonts-themes.nix
# rocmPackages.clang # ollama.acceleration
# socat
# starship # programs.starship.enable
# swappy # wayland snapshot editing tool
# swaybg
# syntax-highlighting
# tesseract-data-eng
# tesseract4 # OCR Optical character recognition (sees characters and identifies them, i.e. document reader)
# ttf-twemoji
# upower
# vdirsyncer
# wf-recorder
# wget
# wireplumber # audio.nix
# wlogout
# wtype
# xdg-desktop-portal # xdg.portal = {enable = true;}
# xwayland # enabled by default in niri
# ydotool
# -------------------------dep list-----------------------------
# # Caelestia-shell & CLI/dots:  (all changes)
# # configs:
# # hypr
# # starship
# # foot
# # fish
# # fastfetch
# # uwsm
# # btop
# spicetify-cli
# spotify
# # spicetify configs
# # "spicetify config current_theme caelestia color_scheme caelestia custom_apps marketplace"
# vscodium
# # vscodium /settings.json /keybindings.json $config/codium-flags.conf
# # vscodium --install-extension vscode/caelestia-vscode-integration/caelestia-vscode-integration-*.vsix
# discord
# equicord
# openasar
# firefox # calls for zen, which is, to my surprise, unavailable on the nix store as of now...
# hyprpicker
# hypridle
# wl-clipboard
# cliphist
# bluez-utils
# inotify-tools #(scripts!!)
# app2unit #?
# wireplumber
# trash-cli
# foot
# fish
# starship
# btop
# jq
# socat
# imagemagick
# adw-gtk-theme
# papirus-icon-theme
# qt5ct-kde
# qt6ct-kde
# ttf-jetbrains-mono-nerd
# # end-4 Illogical Impulse deps:
# # audio
# cava
# pavucontrol-qt #necessary?
# wireplumber
# libdbusmenu-gtk3
# playerctl
# # backlight:
# geoclue
# brightnessctl
# ddcutil
# # basic:
# axel # terminal download accelerator
# bc # calculator
# coreutils # built-in on nixos
# cliphist # wayland clipboard manager
# # rsync # enable services.rsyncd
# # wget # not sure this will be really necessary
# ripgrep # search tool in cli
# # jq # script parser for json, like sed
# meson # Python build system
# xdg-user-dirs
# # font-&-themes:
# # adw-gdt-theme.git
# # breeze # plasma theme
# # breeze-plus
# darkly-bin # qt style
# eza # replace "ls" with an alias
# # fish # shell, enable with programs.fish.enable and customize options galore.
# fontconfig # lib for font custtomization
# python313Packages.kde-material-you-colors
# kitty
# matugen
# # otf-space-grotesk unavailable in nixos
# # starship # enable with programs.starship.enable + options
# # ttf-gabarito-git # unavailable
# nerd-fonts.ttf-jetbrains-mono-nerd
# material-symbols
# # ttf-readex-pro unavailable
# # ttf-rubic-vf
# ttf-twemoji
# # hyprland:
# hypridle
# # hyprcursor
# # hyprland-qtutils
# # hyprland-qt-support
# # hyprlang
# hyprlock
# hyprpicker
# # hyprsunset
# # hyprutils
# # hyprwayland-scanner
# #xdg-desktop-portal-hyprland
# wl-clipboard
# # kde:
# kdePackages.bluedevil
# # gnome-keyring # services.gnome.gnome-keyring.enable
# # networkmanager
# kdePackages.plasma-nm
# kdePackages.polkit-kde-agent-1
# kdePackages.dolphin
# kdePackages.systemsettings
# # microtex-git: for writing math equations
# # tinyxml-2 # "simple, small, efficient, C++ XML parser
# gtkmm3
# gtksourceviewmm # I don't even know
# cairomm # neither do I know what this does
# # portal:
# xdg-desktop-portal
# xdg-desktop-portal-kde
# xdg-desktop-portal-gtk
# xdg-desktop-portal-hyprland
# python314
# rocmPackages.clang
# # uv # python package installer
# # gtk4 # backend
# # libadwaita # lib for mobile devices
# # libsoup3 # c library
# # libportal-gtk4 # flatpak portal library
# # gobject-introspection # middleware layer between C and language
# # sassc
# # python-opencv
# # screencapture
# hyprshot
# slurp
# swappy # wayland snapshot editing tool
# tesseract4 # OCR
# tesseract-data-eng
# wf-recorder
# #toolkits:
# kdePackager.kdialog
# qt6-5compat
# qt6-avif-image-plugin
# qt6-base
# qt6-declariative
# qt6-imageformats
# qt6-multimedia
# qt6-positioning
# qt6-quicktimeline
# qt6-sensors
# qt6-svg
# qt6-tools
# qt6-translations
# qt6-virtualkeyboard
# qt6-wayland
# syntax-highlighting
# upower
# wtype
# ydotool
# # widgets:
# fuzzel
# glib2
# nm-connection-editor
# quickshell-git
# translate-shell
# wlogout
# # DankMaterialShell-dependencies:
# brightnessctl
# cava
# cliphist
# dgop
# khal
# matugen
# python-aiohttp-oauthlib
# vdirsyncer
# wl-clipboard
# Fonts:
# # Theming:
# gtk-4
# gtk-3
#   gtk-engine-murrine # (theme-colloid)
#   qt6ct
#   qt5ct
#   matugen
#   # noctalia-shell-dependencies:
#   bluez
#   brightnessctl
#   cava
#   cliphist
#   ddcutil
#   gpu-screen-recorder
#   libnotify
#   matugen
#   networkmanager
#   wl-clipboard
#   # Fonts:
#   material-symbols
#   roboto
#   inter-nerdfont
#   # Theming:
#   gtk4
#   gtk3
#   qt6ct
#   qt5ct

