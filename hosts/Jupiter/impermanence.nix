{lib, ...}: {
  #  Reset root subvolume on boot
  boot.initrd.postResumeCommands = lib.mkAfter ''

    mkdir /mnt
    mount /dev/disk/by-partlabel/disk-main-root /mnt

    if [[ -e /mnt/@ ]]; then
      mkdir -p /mnt/@snapshots/rootfs
      timestamp_root=$(date --date="@$(stat -c %Y /mnt/@)" "+%Y-%m-%-d_%H:%M:%S")
      mv /mnt/@ "/mnt/@snapshots/rootfs/$timestamp_root"
    fi

    if [[ -e /mnt/@home ]]; then
      mkdir -p /mnt/@snapshots/home
      timestamp_home=$(date --date="@$(stat -c %Y /mnt/@home)" "+%Y-%m-%-d_%H:%M:%S")
      mv /mnt/@home "/mnt/@snapshots/home/$timestamp_home"
    fi

    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/mnt/$i"
      done
      btrfs subvolume delete "$1"
    }

    for i in $(find /mnt/@snapshots/rootfs/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    for i in $(find /mnt/@snapshots/home/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@home

    umount /mnt
  '';
}
