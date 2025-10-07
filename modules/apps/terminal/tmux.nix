{lib, ...}: {
  programs.tmux = {
    enable = lib.mkDefault true;
  };
}
