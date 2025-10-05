{pkgs, ...}: {
  # Dont use something generic like "user".
  users = {
    groups.europa = {};
    users.europa = {
      isNormalUser = true;

      # Change me!
      name = "europa";
      home = "/home/europa";
      description = "europa";

      # Change me! generate with `mkpasswd -m SHA-512 -s`
      initialHashedPassword = "$6$FvDQ8oWQGK59OCJi$yW0cAwpJHZdZWOv9f7TwqUr5Zjtz9/E44pQIvpBLbgYEM/JzVdiwxBxN7ujEjrBXdaZ5lEBK8MQpwXUVnDtdT0";
      # This one is "password"

      # "your-user"
      group = "europa";
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
  };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "europa"
      ]; # Set users that are allowed to use the flake command
    };
  };
}
