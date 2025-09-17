{lib, ...}: {
  programs.yazi = {
    enable = lib.mkDefault true;
    plugins = {};
    flavors = {};
    settings = {
      yazi = {
        mgr = {
          ratio = [1 4 4];
          sort_by = "natural";
          linemode = "mtime";
          scrolloff = 3;
          mouse_events = ["click" "scroll" "touch" "move" "drag"];
        };
      };
    };
  };
}
