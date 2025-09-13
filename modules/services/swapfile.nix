{...}: {
  swapDevices = [
    {
      device = "persist/swap/swapfile";
      size = 20 * 1024;
      priority = 0;
    }
  ];
  ## If you, for whatever reason, decide to change where your swap goes, you'll
  ## have to also change this script to reflect the changec, along with the
  ## swap device above.
  systemd.services.setup-swap-nocow = {
    serviceConfig.Type = "oneshot";
    wantedBy = ["swap.target"];
    before = ["swap.target"];
    after = ["persist-swap.mount"];
    script = ''
      SWAPDIR="/persist/swap"

      # Check if directory has +C attribute
      if ! lsattr -d "$SWAPDIR" | awk '{print $1}' | grep -q "C"; then
        echo "Swap directory lacks +C attribute, fixing..."

        # Turn off any existing swap in this directory
        for swapfile in "$SWAPDIR"/*; do
          [[ -f "$swapfile" ]] && swapoff "$swapfile" 2>/dev/null || true
        done

        # Remove existing swapfiles
        rm -f "$SWAPDIR"/swapfile*

        # Set +C on directory
        chattr +C "$SWAPDIR"

        echo "Swap directory is now no-COW. NixOS will recreate swapfiles."
      fi
    '';
  };
}
