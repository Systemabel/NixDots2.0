{...}: {
  hardware.bluetooth = {
    enable = true;
    # package = pkgs.bluez; # default: pkgs.bluez
    # input = {}; # config input service (/etc/bluetooth/input.conf). See https://github.com/bluez/bluez/blob/master/profiles/input/input.conf
    # network = {}; # config network service (/etc/bluetooth/network.conf). See https://github.com/bluez/bluez/blob/master/profiles/network/network.conf
    # settings = {}; # config system-wide bluetooth (/etc/bluetooth/main.conf). See https://github.com/bluez/bluez/blob/master/src/main.conf
  };
  services.blueman.enable = true;
}
