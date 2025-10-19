{pkgs, ...}: {
  # This is a gpu overclocking/undervolting and fan control tool - It's very nice, but most people won't use it.
  # TODO make lact an option
  services.lact.enable = true;

  # AMD graphics card drivers:
  boot.initrd.kernelModules = ["amdgpu"];
  hardware.amdgpu.overdrive.enable = true; # specifically for lact and overclocking

  # brightness control driver setup
  hardware.i2c.enable = true;
  services.udev.packages = [pkgs.ddcutil];
  users.groups.i2c = {};
  boot.kernelModules = [
    "i2c-dev"
    "i2c-piix4" # for many AMD/Intel desktops via SMBus
    # "i2c-i801" # common on Intel chipsets (uncomment on Intel)
    # "i2c-nvidia" # NVIDIA propietary driver systems
  ];
}
