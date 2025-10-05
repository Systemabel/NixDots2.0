{...}: {
  imports = [
    ./boot.nix
    ./hardware
    ./env.nix
    ./persist-shadow.nix
    ./persist.nix
  ];
}
# [ ] double-check all core functionality:
# [x] impermanence
# [ ] -- audio mixing (midi input)
# [ ] -- bluetooth connection with the right adapter

