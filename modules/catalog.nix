# This is just an idea from chatGPT for helping me see all the programs
# installed in one place. It's slightly convoluted, but perhaps it might pay
# off in the future...
# Also, right now, this isn't imported anywhere, so it's inert...
{pkgs, ...}: let
  groups = {
    cli = with pkgs; [
      bat
      curl
      eza
      jq
      nix-tree
      ripgrep
      tealdeer
      trash-cli
      tree
    ];
    dev = with pkgs; [
      alejandra
      git
      vscodium
    ];
    terminal = with pkgs; [
      ghostty
      kitty
    ];
    apps = with pkgs; [
      fastfetch
      firefox
      kdePackages.dolphin
      servo
      spotify
      vscodium
      waytrogen
      keepassxc
    ];
    fonts = with pkgs; [
      inter-nerdfont
      material-symbols
      nerd-fonts.ttf-jetbrains-mono-nerd
      roboto
      papirus-icon-theme
    ];
    util = with pkgs; [
      anyrun
      brightnessctl
      btop
      cava
      ddcutil
      fastfetch
      htop
      hypridlehyprlock
      mpvpaper
      raffi
      spicetify-cli
      translate-shell
      swww
      wl-clipboard-rs
    ];
    core = with pkgs; [
      kdePackages.polkit-kde-agent-1
      mesa
      niri # rust
      quickshell # c++
    ];
  };

  # Optional: name-indexed map for program.<app>.package overrides:
  byName = {
    alejandra = pkgs.alejandra;
    anyrun = pkgs.anyrun;
    brightnessctl = pkgs.brightnessctl;
    btop = pkgs.btop;
    cava = pkgs.cava;
    ddcutil = pkgs.ddcutil;
    eza = pkgs.eza;
    firefox = pkgs.firefox;
    bat = pkgs.bat;
    fastfetch = pkgs.fastfetch;
    git = pkgs.git;
    ghostty = pkgs.ghostty;
    htop = pkgs.htop;
    hypridle = pkgs.hypridle;
    hyprlock = pkgs.hyprlock;
    inter-nerdfont = pkgs.inter-nerdfont;
    kdePackages.dolphin = pkgs.kdePackages.dolphin;
    kdePackages.polkit-kde-agent-1 = pkgs.kdePackages.polkit-kde-agent-1;
    keepass = pkgs.keepassxc;
    kitty = pkgs.kitty;
    material-symbols = pkgs.material-symbols;
    mesa = pkgs.mesa;
    mpvpaper = pkgs.mpvpaper;
    nerd-fonts.ttf-jetbrains-mono-nerd = pkgs.nerdfonts.ttf-jetbrains-mono-nerd;
    nix-tree = pkgs.nix-tree;
    quickshell = pkgs.quickshell;
    roboto = pkgs.roboto;
    papirus-icon-theme = pkgs.papirus-icon-theme;
    raffi = pkgs.raffi;
    rink = pkgs.rink;
    ripgrep = pkgs.ripgrep;
    servo = pkgs.servo;
    spicetify-cli = pkgs.spicetify-cli;
    spotify = pkgs.spotify;
    swww = pkgs.swww;
    tealdeer = pkgs.tealdeer;
    translate-shell = pkgs.translate-shell;
    trash-cli = pkgs.trash-cli;
    tree = pkgs.tree;
    vscodium = pkgs.vscodium;
    waytrogen = pkgs.waytrogen;
    wl-clipboard = pkgs.wl-clipboard;
  };

  systemPackages =
    builtins.concatLists (builtins.attrValues groups);
in {
  inherit groups byName systemPackages;
}
