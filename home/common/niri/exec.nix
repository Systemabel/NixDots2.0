{...}: {
  programs.niri.settings.spawn-at-startup = [
    {sh = "qs -c $qsConfig &";}
    {argv = "lact";}
    {sh = "bash -c wl-paste --watch clipvault store &";}
    {argv = "niriswitcher";}
  ];
}
