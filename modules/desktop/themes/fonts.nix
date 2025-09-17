{pkgs, ...}: {
  fonts.packages = with pkgs; [
    fira-code-nerdfont
    inter-nerdfont
    material-symbols
    nerd-fonts.jetbrains-mono
    roboto
    papirus-icon-theme
  ];
}
