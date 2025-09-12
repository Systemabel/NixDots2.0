{
  pkgs,
  config,
  ...
}: {
  # Change "orca" to a unique username-- dont use something generic like "user".
  # because that just makes things more ambiguous, obviously.
  users.groups.orca = {};
  users.users.orca = {
    isNormalUser = true;
    # Change me!
    name = "orca";
    home = "/home/${config.users.users.orca.name}";
    description = "orca";
    # Change me! generate with `mkpasswd -m SHA-512 -s`
    # initialHashedPassword = "$6$9I35TBWjqxI.jPEm$fX37utl6dDHFMd0V5l5ZmwVcuOGFdaKWkngIZCv.ML8GFxOg5dhxvpIeHLc6TxGYW6paw5b3Nx5ujls/ChWXC.";

    # "your-user"
    group = "orca";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "audio"
      "video"
      "input"
      "i2c"
      "scanner"
      "lp"
      "root"
      "sudo"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "orca"
      ]; # Set users that are allowed to use the flake command
    };
  };
  imports = [./orca];
  fileSystems."/home/orca/archroot" = {
    device = "cad53379-89a4-4110-b033-c6686ca0274d";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "natime"
      "compress=zstd"
      "autodefrag"
    ];
  };
  fileSystems."/home/orca/myliege" = {
    device = "2e8b0fa2-be26-45dc-a19a-9bcfec2efd7f";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "natime"
      "compress=zstd"
      "autodefrag"
    ];
  };
  fileSystems."/home/orca/Games" = {
    device = "2e8b0fa2-be26-45dc-a19a-9bcfec2efd7f";
    fsType = "btrfs";
    options = [
      "subvol=@games"
      "natime"
      "compress=zstd"
      "autodefrag"
    ];
  };
}
