{...}: {
  imports = [
    ./boot.nix
    ./hardware
    ./env.nix
    ./persist-shadow.nix
    ./persist.nix
  ];
}
