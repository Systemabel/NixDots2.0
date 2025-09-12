{...}: {
  # Testing making a change and pushing
  # After formatting with disko, the following is more robust for LUKS
  # boot.initrd.luks.devices = {
  #   cryptroot = {
  #     device = "/dev/disk/by-partlabel/luks";
  #     allowDiscards = true;
  #     preLVM = true;
  #   };
  # };
}
