{
  pkgs,
  lib,
  ...
}: {
  #  Reset root subvolume on boot
  boot.initrd.postResumeCommands = lib.mkAfter ''

    mkdir /btrfs_tmp
    mount /dev/disk/by-partlabel/disk-main-root /btrfs_tmp

    if [[ -e /btrfs_tmp/@ ]]; then
    mkdir -p /btrfs_tmp/old_roots
    timestamp_root=$(date --date="@$(stat -c %Y /btrfs_tmp/@)" "+%Y-%m-%-d_%H:%M:%S")
    mv /btrfs_tmp/@ "/btrfs_tmp/old_roots/$timestamp_root"
    fi

    if [[ -e /btrfs_tmp/@home ]]; then
    mkdir -p /btrfs_tmp/old_home
    timestamp_home=$(date --date="@$(stat -c %Y /btrfs_tmp/@home)" "+%Y-%m-%-d_%H:%M:%S")
    mv /btrfs_tmp/@home "/btrfs_tmp/old_home/$timestamp_home"
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
    btrfs subvolume create /btrfs_tmp/@home

    umount /btrfs_tmp
  '';

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
    "/persist" = {
      hideMounts = true;
      users.orca = {
        directories = [
          ".cache/nix-index"
          ".cache/mozilla"
          ".config/anyrun"
          ".config/fuzzel"
          ".config/ghostty"
          ".config/keepassxc"
          ".config/niri"
          ".config/nix-search-tv"
          ".config/noctalia"
          ".config/pipewire"
          ".config/Plasticity"
          ".config/quickshell"
          ".config/spotify"
          ".config/sunsetr"
          ".config/television"
          ".config/VSCodium"
          ".config/xdg-desktop-portal-termfilechooser"
          ".config/yazi"
          ".git"
          ".local/share/color-schemes"
          ".local/share/dbus-1"
          ".local/share/gk"
          ".local/share/Trash"
          ".local/state/clipvault"
          ".local/state/nix"
          ".local/state/wireplumber"
          ".mozilla"
          ".pki"
          ".plasticity"
          ".ssh"
          ".vscode-oss"
          "Documents"
          "flake"
          "Pictures/Wallpapers"
        ];
        files = [
          ".config/dolphinrc"
          ".config/katerc"
          ".config/kiorc"
          ".config/KleverNotesrc"
          ".config/Preferences"
          ".config/starship.toml"
          ".local/share/clipvault.db"
          ".local/share/recently-used.xbel"
          ".local/share/user-places.xbel"
          ".bash_history"
          ".face"
          ".gitconfig"
          ".gitignore"
          ".zsh_history"
        ];
      };
    };
  };

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
