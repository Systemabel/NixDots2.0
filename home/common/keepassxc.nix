{
  lib,
  outputs,
  pkgs,
  ...
}: {
  # xdg.configFile."autostart/org.keepassxc.KeePassXC.desktop".source = "${pkgs.keepassxc}/share/applications/org.keepassxc.KeePassXC.desktop";

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };
  programs.keepassxc = {
    enable = true;
  };
}
