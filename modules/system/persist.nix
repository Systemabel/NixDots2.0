{...}: {
  # Use /persist as the persistence root, matching Disko's mountpoint
  environment.persistence = {
    "/persist/.rootfs" = {
      hideMounts = true;
      directories = [
        "/etc/ssh"
        "/etc/NetworkManager/system-connections"
        "/var/spool" # Mail queues, cron jobs
        # "/var/lib/bluetooth" don't have to worry about this one because the
        # lib subvol omits this directory from @ rewrites
        "/srv" # Web server data, etc.
        "/root"
      ];
      files = [
        "/etc/machine-id"
        # "/etc/shadow"
      ];
    };
  };
}
