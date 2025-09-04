# NixDots2.0

STATUS:
Will boot, has no functionality at the moment, but there's lots planned...

This flake is a big combination of various tutorial flakes. 
Namely, so far:
 - https://saylesss88.github.io/installation/index.html
 - https://code.m3ta.dev/m3tam3re/nixcfg

dots-inspiration:
 - end-4 illogical impulse, of course:
   https://github.com/end-4/dots-hyprland
 - Caelestia dots:
   https://github.com/caelestia-dots/shell?tab=readme-ov-file
 - DankMaterialShell:
   https://github.com/AvengeMedia/DankMaterialShell
 - Ly-sec's nix dots:
   https://github.com/Ly-sec/nixos (old commits? as seen here):
   https://www.reddit.com/r/unixporn/comments/1lmxjlx/niri_quickshell/
   who found inspo from
   - Rexcrazy804's dots:
     https://github.com/Rexcrazy804/Zaphkiel
   - Noctalia's shell:
     https://github.com/noctalia-dev/noctalia-shell

Lots of different flakes and styles to build off of!
Design philosophy:
      I used hyprland for a long time (thanks to End-4). It's great! Then I 
  discovered scrolling window managers, found niri (all rust!) and I 
  haven't really looked back. 
      I've also seen the extreme benefit's of using outfoxxed's quickshell,
  and I plan for it to essentially be a core part of this desktop 
  environment.
      I have a desktop computer, so I don't plan to run this on a laptop, and
  I can't easily test on a laptop (my work computer is a mac). However, I 
  will include anything that's included in other repos aimed at laptop 
  users, such as battery related stuff, or brightnessctl instead of 
  ddcutil.
      The aim is to make a desktop environment that's compatible, expandable,
  and sharable to friends and family so that everyone can enjoy! The more 
  people on linux, the better. 

Some features that I'd like to add:
 - encryption and secure secrets (!!!)
 - modular packages for the most common tools
 - I want bells and whistles and every feature of a desktop working as it
should
