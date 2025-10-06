#!/usr/bin/env bash

exec > >(tee -a ./install.log) 2>&1

display_choices() {
  echo "========================================================================="
  echo "Chosen username: " "$username"
  echo "Chosen hostname: " "$hostname"
  echo "Time zone: " "$timezone"
  echo "Encryption: " "$encryptDesc"
  echo "Disk selection: " "$diskDesc"
  echo "========================================================================="
  echo
}
get_disk_choice() {
  display_choices
  echo
  echo "What storage device do you wish to use? (This installer will completely"
  echo "erase the contents of that device - you'll be warned beforehand)"
  echo
  echo "Just so you can see:"
  echo "> lsblk -o name,size,model,serial"
  lsblk -o name,size,model,serial
  echo
  echo "Sometimes drive names can change randomly, however the device-id doesn't"
  echo "change, so that's what will be used in the config. Please double check"
  echo "your chosen storage device with the model and serial above and below:"
  echo
  
  # Get disk IDs and create arrays for both device names and formatted options
  local diskIds=($(ls /dev/disk/by-id | grep -v "part\|_1\|eui"))
  local diskDescs=()
  local options=()
  
  # Check if any disks were found
  if [[ ${#diskIds[@]} -eq 0 ]]; then
    echo "Error: No disks found in /dev/disk/by-id"
    exit 1
  fi
  
  for diskId in "${diskIds[@]}"; do
    # Resolve the symlink to get the actual device name (e.g., nvme0n1, sda)
    local devName=$(readlink -f "/dev/disk/by-id/$diskId" | sed 's|/dev/||')
    diskDescs+=("$devName")
    options+=("$devName --> $diskId")
  done
  
  # Present the formatted options for selection
  PS3="Which storage device will you install NixOS on? (number): "
  echo
  select option in "${options[@]}"; do
    if [[ -n "$option" ]]; then
      echo "You selected: $option"
      # Get the index of the selection to retrieve the corresponding values
      for i in "${!options[@]}"; do
        if [[ "${options[$i]}" = "$option" ]]; then
          diskDesc="${diskDescs[$i]}"
          diskChoice="${diskIds[$i]}"
          break
        fi
      done
      break
    else
      echo "Invalid selection. Please try again."
    fi
  done
  clear
}
get_encryption_choice() {
  display_choices
  echo "Do you want an encryption? This will install NixOS just the same, except"
  echo "that the installation will live within a LUKS2 encrypted volume."
  echo "There are a number of methods for decryption at boot which can be set up"
  echo "later. Encryption protects your data from any access when the drive isn't" 
  echo "in use, i.e. while you're NOT using the volume. When your computer is on,"
  echo "the volume is decrypted and your data is accessible."

  local input
    
  while true; do
    read -p "encrypt? (y/N): " input
        
    case $input in
      [yY]|"yes"|"Yes"|"YES")
        encryptChoice=true
        encryptDesc="LUKS2 on system volume"
        break
      ;;
      [nN]|"no"|"No"|"NO"|"") 
        encryptChoice=false
        encryptDesc="none"
        break
        ;;
      *) 
        echo "Invalid choice."
        echo
        # Loop continues, asking again
        ;;
    esac
  done
  clear
}
get_hostname() {
  display_choices
  echo "What would you like as your hostname?"
  echo "Others on your network will see this."
  local input
    
  while true; do
    read -p "hostname: " input
        
    # Check if empty
    if [[ -z "$input" ]]; then
      echo "Error: Hostname cannot be empty. Please try again."
      continue
    fi
        
    # Optional: Check for valid hostname format (alphanumeric and hyphens only)
    if [[ ! "$input" =~ ^[a-zA-Z0-9-]+$ ]]; then
      echo "Error: Hostname can only contain letters, numbers, and hyphens."
      continue
    fi
        
    # All checks passed
    hostname="$input"
    break
  done
  clear 
}
get_timezone() {
  display_choices
  echo "Next, running tzselect to assign timezone to your flake"
  timezone=$(tzselect)
  clear
}
get_username() {
  display_choices
  echo "What would you like as your username? Linux usernames are all lower-case."
  echo "Pick something unique - avoid 'user' or anything too generic - the script"
  local input
  local generic_names=("user" "admin" "administrator" "root" "test" "nixos" "linux" "mysql" "postgres" "www-data" "ftp" "ssh")
    
  while true; do
    read -p "username: " input
        
    # Check if empty
    if [[ -z "$input" ]]; then
      echo "Error: Username cannot be empty. Please try again."
      continue
    fi
        
    # Convert to lowercase for checking
    local lowercase_input="${input,,}"
        
    # Check if too generic
    local is_generic=false
    for generic in "${generic_names[@]}"; do
      if [[ "$lowercase_input" == "$generic" ]]; then
        is_generic=true
        break
      fi
    done

    # Check for valid username format (alphanumeric and hyphens only)
    if [[ ! "$input" =~ ^[a-zA-Z0-9_-]+$ ]]; then
      echo "Error: Username can't contain spaces or special characters."
      continue
    fi
        
    if [[ "$is_generic" == true ]]; then
      echo "Error: '$input' is too generic. Pick something unique."
      continue
    fi
        
    # All checks passed
    username="$lowercase_input"
    break
  done
  clear
}
ask_for_changes() {
  while true; do
    display_choices
    echo "Check your configuration above. Is there anything you'd like to change?"
    echo
    echo "1) Username"
    echo "2) Hostname"
    echo "3) Timezone"
    echo "4) Encryption enrollment"
    echo "5) Install disk"
    echo
    echo "Or press any button to continue or ctrl+C to exit setup without making" 
    echo "changes."
    echo
    read -p "Select (number): " input
        
    case $input in
      [1])
        clear
        get_username
      ;;
      [2]) 
        clear
        get_hostname
        ;;
      [3]) 
        clear
        get_timezone
        ;;
      [4])
        clear
        get_encryption_choice
      ;;
      [5])
        clear
        get_disk_choice
      ;;
      ""|*)
        clear
        break
      ;;
    esac
  done
}

echo "=============================================="
echo "Welcome to Systemabel's nixos flake installer."
echo "=============================================="
echo 
echo "A few questions... press any button to continue"; read
clear

get_username
get_hostname
get_timezone
get_encryption_choice
get_disk_choice
ask_for_changes

display_choices
echo "## READ CAREFULLY ##"
echo "The next step is applying these choices to the flake's config files."
echo "Following those changes, ${diskDesc} will be erased and partitioned."
echo "Then, NixOS will be installed on ${diskDesc} with the displayed"
echo "parameters above. The flake is set to allow changing bootloader entry"
echo "priority so this flake will become the default boot entry on reboot."
echo
echo "This is an irreversible step; if there's anything on your drive you want"
echo "to back up, cancel now and do so then run this script again when you're"
echo "ready."
echo
echo "========================================================================="
echo

echo "Press any button to continue, or ctrl+C to exit without making changes." 
echo "Continue?"; read

echo "Thinking... reading... writing... copying..."
echo
sleep 1 "========================================================================="
echo "### Applying username..."
  mkdir users/"$username"
echo "users folder:" && ls users
echo
  cp -r -v users/template/* users/"$username"
echo
  echo "users/$username folder:" && ls users/"$username"
echo
  sed -i "s/template/$username/g" users/"$username"/user.nix
echo
    echo "## Lines changed in users/$username/user.nix:"
    grep -n "$username" users/"$username"/user.nix
echo
  sed -i "s|users\.[^ ]* = {|users.$username = {|" users/"$username"/persist.nix
    echo "## Lines changed in users/$username/persist.nix"
    grep -n "$username" users/"$username"/persist.nix
echo
  sed -i "s|{imports = \[\./.*\];}|{imports = [./$username];}|" users/default.nix
    echo "## Lines changed in users/default.nix:"
    grep -n "$username" users/default.nix
echo
sleep 1 "========================================================================="
echo "### Applying hostname with encryption choice..."
echo
  mkdir hosts/"$hostname"
  if [ "$encryptChoice" = true ]; then
    cp -v hosts/Jupiter/* hosts/"$hostname"
  else
    cp -v hosts/Saturn/* hosts/"$hostname"
  fi
    echo "hosts folder:" && ls hosts
echo
    echo "hosts/$hostname folder:" && ls hosts/"$hostname"
sleep 1
echo
echo "### Updating hostname references throughout flake..."
echo
  sed -i "s|[^ ]* = nixpkgs\.lib\.nixosSystem {|$hostname = nixpkgs.lib.nixosSystem {|" flake.nix
  sed -i "s|\./hosts/.*|\./hosts/$hostname|" flake.nix
    echo "## Lines changed in flake.nix"
    grep -n "$hostname" flake.nix
  sed -i "s|^\s*networking\.hostName = \".*\";|  networking.hostName = \"$hostname\";|" hosts/"$hostname"/configuration.nix
    echo "## Lines changed in hosts/$hostname/configuration.nix"
    grep -n "$hostname" hosts/"$hostname"/configuration.nix

echo
sleep 1 "========================================================================="
echo "### Applying timezone..."
  sed -i "s|^\s*time\.timeZone = \".*\";|  time.timeZone = \"$timezone\";|" hosts/"$hostname"/configuration.nix
    echo "## Lines changed in hosts/$hostname/configuration.nix"
    grep -n "$timezone" hosts/"$hostname"/configuration.nix
echo
sleep 1 "========================================================================="
echo "### Applying drive label to disk-config.nix"
echo
  sed -i "s|^\s*device = \"/dev/disk/by-id/.*\"|      device = \"/dev/disk/by-id/$diskChoice\"|" hosts/"$hostname"/disk-config.nix
    echo "## Lines changed in hosts/$hostname/configuration.nix"
    grep -n "$diskChoice" hosts/"$hostname"/disk-config.nix

echo "...done!"
echo "Created the user $username, created the host $hostname with respect"
echo "to your chosen encryption settings, and applied the selected disk-id in"
echo "$hostname/disk-config.nix."

sleep 1
echo "========================================================================="
echo "### Wiping $diskDesc, creating partitions, then mounting them..."
echo "> sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ~/FlakenDots/hosts/$hostname/disk-config.nix"
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ~/FlakenDots/hosts/"$hostname"/disk-config.nix
    echo "mounted btrfs: " && mount | grep btrfs

sleep 1
echo "========================================================================="
echo "### Initializing default hardware-configuration.nix..."
echo "> sudo nixos-generate-config --root /mnt --no-filesystems" 
echo
  sudo nixos-generate-config --root /mnt --no-filesystems
    echo "/mnt/etc/nixos folder:" && ls /mnt/etc/nixos

sleep 1
echo "========================================================================="
echo "### copying install files..."
echo "> sudo mkdir -p /mnt/persist/home/$username/.flake" 
echo "> sudo cp -r ~/FlakenDots/* /mnt/persist/home/$username/.flake"
echo "> sudo cp /mnt/etc/nixos/hardware-configuration.nix /mnt/persist/home/$username/.flake/hosts/$hostname/hardware-configuration.nix"
  sudo mkdir -p /mnt/persist/home/"$username"/.flake
  sudo cp -r -v ~/FlakenDots/* /mnt/persist/home/"$username"/.flake/
sleep 1
  sudo cp /mnt/etc/nixos/hardware-configuration.nix /mnt/persist/home/"$username"/.flake/hosts/"$hostname"/

sleep 1
echo "========================================================================="
echo "### copying dotfiles..."
echo "> sudo cp -r .config /mnt/persist/home/$username/"
  sudo cp -r -v .config /mnt/persist/home/"$username"/

sleep 1
echo "========================================================================="
echo "installing nixos..."
echo "cd /mnt/persist/home/$username/.flake"
echo "sudo nixos-install --flake /mnt/persist/home/$username/.flake#$hostname"
  cd /mnt/persist/home/"$username"/.flake
  sudo nixos-install --flake /mnt/persist/home/"$username"/.flake#"$hostname"

echo "========================================================================="
echo "### copying persist files..."
echo "> sudo mkdir -p /mnt/persist/.rootfs/etc"
echo "> sudo cp /mnt/etc/shadow /mnt/persist/.rootfs/etc/"
echo "> sudo cp -r /mnt/etc/ssh /mnt/persist/.rootfs/etc/"
echo "> sudo cp /mnt/etc/machine-id /mnt/persist/.rootfs/etc/"
  sudo mkdir -p /mnt/persist/.rootfs/etc
  sudo cp /mnt/etc/shadow /mnt/persist/.rootfs/etc/
  sudo cp -r /mnt/etc/ssh /mnt/persist/.rootfs/etc/
  sudo cp /mnt/etc/machine-id /mnt/persist/.rootfs/etc/
echo "========================================================================="
echo "                              All done!"
echo "========================================================================="

# Use this and modify the path if you're running from arch like I used to...
# PATH="$PATH:/usr/sbin:/sbin:/nix/var/nix/profiles/system/sw/bin" nixos-install --flake /mnt/etc/nixos/flake#Finn --root /mnt
