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

  console.keyMap = "us";
  services.xserver.xkb = {
    layout = "us";
    variant = ""; # empty "" is qwerty. You can also do something like
    # "colemak" or "dvorak" if you wanted to...
  };

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
