{config, ...}: {
  xdg.desktopEntries = {
    KeepassXC = {
      name = "KeepassXC";
      genericName = "Password Manager";
      exec = "keepassxc";
      icon = "keepassxc";
      startupNotify = true;
      terminal = false;
      type = "Application";
      categories = ["Utility" "Security" "Qt"];
      mimeType = ["application/x-keepass2"];
    };
  };
}
