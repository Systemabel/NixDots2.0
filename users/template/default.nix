{...}: {
  imports = [
    ./android-dev
    ./user-env.nix
    ./keymap.nix
    ./persist.nix
    # ./pianoteq.nix
    # ./texlive.nix
    ./user-apps.nix
    ./user.nix
  ];
}
