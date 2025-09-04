{
  disko.devices = {
    disk.nvme1n1 = {
      type = "disk";
      device = "/dev/nvme1n1";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 1;
            label = "EFI-nixos";
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/efi";
              extraArgs = ["-n" "EFI-nixos"];
              mountOptions = ["umask=0077"];
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = ["-L" "nixos" "-f"];
              subvolumes = {
                "@root" = {
                  mountpoint = "/";
                  mountOptions = ["subvol=@root" "compress=zstd" "noatime" "autodefrag"];
                };
                "@root-blank" = {
                  mountOptions = ["subvol=@root-blank" "nodatacow" "noatime" "autodefrag"];
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
