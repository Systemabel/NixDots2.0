{...}: {
  networking = {
    networkmanager.enable = true;
    enableIPv6 = true;
  };
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    allowSFTP = true;
  };
}
