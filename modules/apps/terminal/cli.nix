{lib, ...}: {
  programs = {
    nh = {
      enable = lib.mkDefault true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "$HOME/flake";
    };
    television = {
      enable = lib.mkDefault true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
