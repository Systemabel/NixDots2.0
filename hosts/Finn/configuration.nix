{...}: {
  # Change me!
  networking.hostName = "Finn"; # Set to your hostname
  time.timeZone = "America/Chicago";

  # [ ] Custom Options
  custom = {
    zram.enable = true;
    # encryptedSetup = false;
    # enableLocalAI = false;
    # # accessibility options include:
    # #   "screenReader" "zoomtool"
    # #   "onScreenKeyboard" "voiceInput" "eyeTracking"
    # #   "englishCC"
    # # Including these options installs the necessary modules and keyboard
    # # shortcuts/hints. Otherwise they are omitted.
    # accessibilityTools = [];
  };

  # These two options are for enabling the drivers for my GPU, then
  # enabling encryption!
  boot.initrd = {
    kernelModules = ["amdgpu"];
    luks.devices = {
      cryptroot = {
        device = "/dev/disk/by-partlabel/luks";
        allowDiscards = true;
      };
    };
  };

  # My desktop computer has a particular motherboard with pcie devices that wake
  # up the system from sleep immediately. This is supposed to solve the issue.
  # see more: https://nixos.wiki/wiki/Power_Management
  # The second udev rule is to disable my particular intel bluetooth adapter,
  # because it's horrible, inconsistent, weak, etc. I use a usb dongle instead.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="8087", ATTRS{idProduct}=="0029", ATTR{authorized}="0"
  '';

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
