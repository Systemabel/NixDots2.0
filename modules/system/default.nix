{...}: {
  imports = [
    ./boot.nix
    ./hardware
    ./impermanence.nix
    ./env.nix
  ];
}
# [ ] double-check all core functionality:
# [x] impermanence
# [ ] -- audio mixing (midi input)
# [ ] -- bluetooth connection with the right adapter

