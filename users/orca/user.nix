{pkgs, ...}: {
  # Dont use something generic like "user".
  users = {
    groups.orca = {};
    users.orca = {
      isNormalUser = true;

      # Change me!
      name = "orca";
      home = "/home/orca";
      description = "orca";

      # Change me! generate with `mkpasswd -m SHA-512 -s`
      initialHashedPassword = "$6$FvDQ8oWQGK59OCJi$yW0cAwpJHZdZWOv9f7TwqUr5Zjtz9/E44pQIvpBLbgYEM/JzVdiwxBxN7ujEjrBXdaZ5lEBK8MQpwXUVnDtdT0";
      # This one is "password"

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
  };
}
