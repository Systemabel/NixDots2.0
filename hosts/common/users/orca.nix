{
  pkgs,
  inputs,
  config,
  ...
}: {
  # Change me to whatever you like:
  users.users.orca = {
    isNormalUser = true;
    # Change me!
    description = "orca";
    # Change me! generate with `mkpasswd -m SHA-512 -s`
    # initialHashedPassword = "$6$9I35TBWjqxI.jPEm$fX37utl6dDHFMd0V5l5ZmwVcuOGFdaKWkngIZCv.ML8GFxOg5dhxvpIeHLc6TxGYW6paw5b3Nx5ujls/ChWXC.";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "audio"
      "video"
      "input"
      "scanner"
      "lp"
      "root"
      # "your-user"
      "orca"
      "sudo"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.orca =
    import ../../../home/orca/${config.networking.hostName}.nix;
}
