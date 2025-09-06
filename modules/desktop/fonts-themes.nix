{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    inter-nerdfont
    material-symbols
    nerd-fonts.jetbrains-mono
    roboto

    papirus-icon-theme
  ];
}
