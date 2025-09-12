{
  lib,
  pkgs,
  ...
}: {
  # You need this (below) to have numpad enabled in tty
  systemd.services.numLockOnTty = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
          ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };
}
