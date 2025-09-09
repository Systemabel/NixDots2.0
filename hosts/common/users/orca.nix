{
  pkgs,
  inputs,
  config,
  ...
}: {
  # Change me to whatever you like:
  users.groups.orca = {};
  users.users.orca = {
    isNormalUser = true;
    # Change me!
    description = "orca";
    # Change me! generate with `mkpasswd -m SHA-512 -s`
    # initialHashedPassword = "$6$9I35TBWjqxI.jPEm$fX37utl6dDHFMd0V5l5ZmwVcuOGFdaKWkngIZCv.ML8GFxOg5dhxvpIeHLc6TxGYW6paw5b3Nx5ujls/ChWXC.";
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
      # "your-user"
      "sudo"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
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
}
