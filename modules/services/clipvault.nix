{
  config,
  pkgs,
  ...
}: {
  systemd.user.services."clipvault-store" = {
    description = "Feed Wayland clipboard into clipvault";
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    serviceConfig = {
      execStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.clipvault}/bin/clipvault store";
      after = ["graphical-session.target"];
      restart = "on-failure";
      restartSec = 2;
      environment = ["RUST_LOG=warn"];
    };
  };
}
