{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter-nerdfont
    material-symbols
    nerd-fonts.jetbrains-mono
    roboto
    papirus-icon-theme
  ];
}
