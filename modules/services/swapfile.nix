{pkgs, ...}:
# let
# cfg = config.custom.swapfile;
# in
{
  # options.custom.swapfile = {
  # enable = lib.mkEnableOption "Enable utils module";
  # };
  # config = lib.mkIf cfg.enable {
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
  # };
}
