{lib, ...}: {
  programs.starship = {
    enable = lib.mkDefault true;
    # presets = ["Jetpack"];
  };
}
