{
  lib,
  config,
  ...
}: {
  #  Reset root subvolume on boot
  # boot.initrd.postResumeCommands = lib.mkAfter ''
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount -t btrfs -o subvol=5 ${config.fileSystems."/".device} /btrfs_tmp
    if [[ -e /btrfs_tmp/@ ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/@)" "+%Y-%m-%-d_%H:%M:%S")
      mv /btrfs_tmp/@ "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/@
    umount /btrfs_tmp
  '';

  # Use /persist as the persistence root, matching Disko's mountpoint
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/etc/ssh"
      "/etc/NetworkManager/system-connections"
      "/var/spool" # Mail queues, cron jobs
      # "/var/lib/bluetooth" don't have to worry about this one because the #lib subvol omits this directory from @ rewrites
      "/srv" # Web server data, etc.
      "/root"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
