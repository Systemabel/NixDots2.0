# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{pkgs, ...}: {
  # Change me!
  networking.hostName = "Finn"; # Set to your hostname
  time.timeZone = "America/Chicago";
  console.keyMap = "us";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  systemd.services = {
    create-swapfile = {
      serviceConfig.Type = "oneshot";
      wantedBy = ["swap-swapfile.swap"];
      script = ''
        ${pkgs.coreutils}/bin/truncate -s 0 /persist/swap/swapfile
        ${pkgs.e2fsprogs}/bin/chattr +C /persist/swap/swapfile
        ${pkgs.btrfs-progs}/bin/btrfs property set /persist/swap/swapfile compression none
      '';
    };
  };

  # Testing making a change and pushing
  # After formatting with disko, the following is more robust for LUKS
  # boot.initrd.luks.devices = {
  #   cryptroot = {
  #     device = "/dev/disk/by-partlabel/luks";
  #     allowDiscards = true;
  #     preLVM = true;
  #   };
  # };

  # Custom Options
  custom = {
    boot.enable = true;
    users.enable = true;
    zram.enable = true;
  };
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
  ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
