{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    # Enabled with custom.users.enable = true; in `configuration.nix`
    custom.users.enable = lib.mkEnableOption "Enables users module";
  };

  config = lib.mkIf config.custom.users.enable {
    users.users = {
      # Change me to whatever you like: xXxNoObPuNiShEr!xXx for example
      orca = {
        homeMode = "755";
        isNormalUser = true;
        # Change me!
        description = "orca";
        # Change me! generate with `mkpasswd -m SHA-512 -s`
        # initialHashedPassword = "$6$GQd2RoFO1i/r3tS3$Qyx/12bCVnaB3akmGu0mKzDfY64guEnz/eEWpzR5GviOJ3jspnBo6rodon0raa.Tc8ikS7wOmG9vla66GVtZQ0";
        extraGroups = [
          "networkmanager"
          "wheel"
          "libvirtd"
          "scanner"
          "lp"
          "root"
          # "your-user"
          "orca"
          "sudo"
        ];
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
        packages = with pkgs; [
          tealdeer
          zoxide
          mcfly
          tokei
          stow
        ];
      };
    };
  };
}
