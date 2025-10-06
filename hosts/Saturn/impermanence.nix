{lib, ...}: {
  #  Reset root subvolume on boot
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    echo "!! starting impermanence script..."

    mkdir -p /mnt
    mount -t btrfs /dev/mapper/cryptroot /mnt
    echo "mounted /dev/disk/by-partlabel/disk-main-root to /mnt"
    ls -a /mnt

    if [[ -e /mnt/@ ]]; then
      mkdir -p /mnt/@snapshots/rootfs
      timestamp_root=$(date --date="@$(stat -c %Y /mnt/@)" "+%Y-%m-%-d_%H:%M:%S")
      mv /mnt/@ "/mnt/@snapshots/rootfs/$timestamp_root"
    fi
    echo "moved and renamed @ to /mnt/@snapshots/rootfs"
    ls -a /mnt/@snapshots/rootfs

    if [[ -e /mnt/@home ]]; then
      mkdir -p /mnt/@snapshots/home
      timestamp_home=$(date --date="@$(stat -c %Y /mnt/@home)" "+%Y-%m-%-d_%H:%M:%S")
      mv /mnt/@home "/mnt/@snapshots/home/$timestamp_home"
    fi
    echo "moved and renamed @home to /mnt/@snapshots/home"
    ls -a /mnt/@snapshots/home

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
    echo "create @ and @home"
    ls /mnt

    umount /mnt
  '';
}
