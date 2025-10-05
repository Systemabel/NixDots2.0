{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-WDC_WDS500G2B0C-00PXH0_2033B6800563";
      # the stupid labels keep swapping on me, and I accidentally reformatted
      # my entire computer. If you accidentally do this, DO NOTHING! DON'T
      # WRITE ANYTHING TO THE DISK! Reboot into a recovery flash drive, and run
      # testdisk --> quick scan. That's what saved me. Search for more
      # documentation on your phone if you need. So, I chose disk/by-id instead.
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 1;
            label = "EFI-NIXOS";
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/efi";
              extraArgs = ["-n" "EFI-NIXOS"];
              mountOptions = ["umask=0077"];
            };
          };
          luks = {
            size = "100%";
            label = "luks";
            content = {
              type = "luks";
              name = "cryptroot";
              content = {
                type = "btrfs";
                extraArgs = ["-L" "nixos" "-f"];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@log" = {
                    mountpoint = "/var/log";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@lib" = {
                    mountpoint = "/var/lib";
                    mountOptions = ["compress=zstd" "noatime" "autodefrag"];
                  };
                  "@swap" = {
                    mountpoint = "/persist/swap";
                    mountOptions = ["noatime" "x-systemd.requires-mounts-for=/persist"];
                  };
                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                    mountOptions = ["noatime" "compress=zstd" "autodefrag"];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
  fileSystems."/var/lib".neededForBoot = true;
  fileSystems."/home".neededForBoot = true;
}
