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
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = ["-L" "nixos" "-f"];
              subvolumes = {
                "@" = {
                  mountpoint = "/";
                  mountOptions = ["subvol=@" "compress=zstd" "noatime" "autodefrag"];
                };
                "@home" = {
                  mountpoint = "/home";
                  mountOptions = ["subvol=@home" "compress=zstd" "noatime" "autodefrag"];
                };
                "@nix" = {
                  mountpoint = "/nix";
                  mountOptions = ["subvol=@nix" "compress=zstd" "noatime" "autodefrag"];
                };
                "@persist" = {
                  mountpoint = "/persist";
                  mountOptions = ["subvol=@persist" "compress=zstd" "noatime" "autodefrag"];
                };
                "@log" = {
                  mountpoint = "/var/log";
                  mountOptions = ["subvol=@log" "compress=zstd" "noatime" "autodefrag"];
                };
                "@lib" = {
                  mountpoint = "/var/lib";
                  mountOptions = ["subvol=@lib" "compress=zstd" "noatime" "autodefrag"];
                };
                "@swap" = {
                  mountpoint = "/persist/swap";
                  mountOptions = ["subvol=@swap" "noatime"];
                  swap.swapfile.size = "18G";
                };
                "@snapshots" = {
                  mountpoint = "/.snapshots";
                  mountOptions = ["subvol=@snapshots" "noatime" "compress=zstd" "autodefrag"];
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
}
