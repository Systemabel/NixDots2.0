{
  pkgs,
  config,
  ...
}: {
  # Change "choose-your-own-character" to a unique username-- dont use something generic like "user".
  # because that just makes things more ambiguous, obviously.
  users.groups.choose-your-own-character = {};
  users.users.choose-your-own-character = {
    isNormalUser = true;
    # Change me!
    name = "choose-your-own-character";
    home = "/home/${config.users.users.choose-your-own-character.name}";
    description = "choose-your-own-character";
    # Change me! generate with `mkpasswd -m SHA-512 -s`
    # initialHashedPassword = "$6$9I35TBWjqxI.jPEm$fX37utl6dDHFMd0V5l5ZmwVcuOGFdaKWkngIZCv.ML8GFxOg5dhxvpIeHLc6TxGYW6paw5b3Nx5ujls/ChWXC.";

    # "your-user"
    group = "choose-your-own-character";
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
        "choose-your-own-character"
      ]; # Set users that are allowed to use the flake command
    };
  };
}
