{pkgs, ...}: {
  # trying to persist /etc/shadow doesn't work due to how it's used in the system
  # so this is a hack alternative to it from the issue linked:
  # https://github.com/nix-community/impermanence/issues/120

  system.activationScripts = {
    etc_shadow = ''
      [ -f "/etc/shadow" ] && cp /etc/shadow /persist/.rootfs/etc/shadow
      [ -f "/persist/.rootfs/etc/shadow" ] && cp /persist/.rootfs/etc/shadow /etc/shadow
    '';

    users.deps = ["etc_shadow"];
  };

  systemd.services."etc_shadow_persistence" = {
    enable = true;
    description = "Persist /etc/shadow on shutdown.";
    wantedBy = ["multi-user.target"];
    path = [pkgs.util-linux];
    unitConfig.defaultDependencies = true;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # Service is stopped before shutdown
      ExecStop = pkgs.writeShellScript "persist_etc_shadow" ''
        mkdir --parents "/persist/.rootfs/etc"
        cp /etc/shadow /persist/.rootfs/etc/shadow
      '';
      # and when it's stopped, it copies shadow to /persist.../shadow
    };
  };
  # This should really only fail if you change passwords, and then have to
  # force-shut down your computer, Which would prevent systemd from updating
  # the backed-up /persist/.rootfs/etc/shadow with the latest password
}
