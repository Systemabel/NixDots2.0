{...}: {
  programs.niri.settings.spawn-at-startup = [
    {sh = "qs -c $qsConfig &";}
    {sh = "lact";}
    {sh = "bash -c wl-paste --watch clipvault store &";}
    {sh = "niriswitcher";}
    {sh = "sunsetr";}
    {sh = "hypridle";}
  ];
}
