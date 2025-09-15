{
  lib,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos-lto;

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    # loader.timeout = 0;

    # consoleLogLevel = 3;
    # /tmp in RAM wiped on reboot
    # kernelParams = [
    #   "quiet"
    #   "systemd.show_status=auto"
    #   "rd.udev.log_level=3"
    #   "plymouth.use-simpledrm"
    # ];

    tmp = {
      useTmpfs = true;
      tmpfsSize = "50%";
    };
    # disable wifi powersave
    extraModprobeConfig = ''
      options iwlmvm  power_scheme=1
      options iwlwifi power_save=0
    '';

    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 30;
        consoleMode = lib.mkDefault "max";
      };
    };
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };
  };
}
