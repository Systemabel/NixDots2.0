# NixOS Desktop Flake

## What's Working?

- Niri is from
  [sodiboo's niri flake](https://github.com/sodiboo/niri-flake) and running flawlessly.
- It's de-gnomified as much as I can tell -- the more I configure the
  environment variaples, dotfiles, and futz around with the memes, the less gnome I see.
  - Even though niri devs document that they list gnome-keyring as an install
    dependency, that hasn't seemed to be a hardset rule. With keepassxc installed,
    (and set as the secret service provider) nix's package dependency seems to
    "intelligently" recognize that gnome-keyring is unnecessary. We'll see if that
    stays true after I do a totally fresh install.
- Currently still using xdp-gtk
  - using **xdg-desktop-portal-termfilechooser** and **-wlr**
  - [keepassxc](https://github.com/keepassxreboot/keepassxc) instead of
    gnome-keyring, as mentioned above
  - See `modules/pkgs-masterlist.nix` and `modules/programs-masterlist.nix` to
    see nearly everything that's included in this flake.

## What's Not Working:

- Luks encryption has not been setup yet, nor has secrets management. Coming
  soon!
- Currently I'm bouncing around qs curations: mainly Noctalia's and
  DankMaterialShell. Noctalia-shell has very few dependencies. DankMaterialShell
  still mostly works even when I'm missing a significant chunk of dependencies.
  The more comprehensive/heavy dots files will not start at all (end-4,
  Caelestia dots). I won't be trying to get those working, though I will be
  poking through everyone's quickshell modules and curating/tweaking to what
  suits my taste.
- small bugs around the place.
  - Dolphin won't open any file or populate a menu
    list without basically 5-10 other seemingly random kdePackages (not random,
    but too much of a hassle to keep track of of, and I've quickly started getting
    used to yazi for all that).
  - some config files seem to not be applying correctly (maybe I've lost track
    of some options I set somewhere in the flake).
  - unconfirmed (not configured) operation of screenshots, screen recording,
    sleep, hibernation, & session lock screen. And I really need the numpad on
    regreet, so that's a WIP.

## This flake is a big combination of various tutorial flakes

- https://saylesss88.github.io/installation/index.html
- https://code.m3ta.dev/m3tam3re/nixcfg

## Dots-inspiration (thank you to y'all)

- [end-4 illogical impulse](https://github.com/end-4/dots-hyprland)
- [Caelestia dots](https://github.com/caelestia-dots/shell?tab=readme-ov-file)
- [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell)
- [kagurazakei's "Shizuru" flake](https://github.com/kagurazakei/Shizuru/tree/main)
- [Ly-sec's nix dots](https://github.com/Ly-sec/nixos) (old commits? as seen
  [in this reddit post](https://www.reddit.com/r/unixporn/comments/1lmxjlx/niri_quickshell))
  who found inspo from
  - [Rexcrazy804's dots](https://github.com/Rexcrazy804/Zaphkiel)
  - [Noctalia's shell](https://github.com/noctalia-dev/noctalia-shell)

### _Lots of different flakes and styles to build off of!_

---

### Design philosophy

I used hyprland for a long time (thanks to **End-4**). It's great! Then I
discovered scrolling window managers, found **niri** and I haven't really looked
back.

I've also seen the extreme benefit's of using
**[outfoxxed's quickshell](https://github.com/quickshell-mirror/quickshell)**,
and I plan for it to essentially be a core part of this desktop environment.

I have a desktop computer, so I don't plan to run this on a laptop, and I can't
easily test on a laptop (my work computer is a mac). However, I will include
anything that's included in other repos aimed at laptop users, such as battery
related stuff, or brightnessctl alongside ddcutil.

The aim is to make a desktop environment that's **compatible**, **expandable**,
and sharable to friends and family so that everyone can enjoy! The more people
on linux, the better, we can all agree.

The more I've been using **home-manager**, the more I realize how much **I don't
like using it**. From what I've gathered, it basically provides an **alternative
way to do all the same things that nixos does**, just with different syntax. And
that's in combination with adding the capability of managing .config files in a
sort of **walled-garden** manner.

> That all said, it's a standard, and I'm a beginner user of nixos and flakes,
> so what do I know?

Other than that, I'm aiming to avoid c++ when there's a proper rust or go
alternative that's receiving regular development. It's a preference.

### Design choices

`anyrun` : ([gh](https://github.com/anyrun-org/anyrun)) Runs nice. Does nice
things. Written in rust. --update: needed to replace it when uninstalling HM.
Ultimately, it may be replaced with some variants of skim, television, fuzzel,
qs, etc. We'll see. I still enjoyed how it felt.

`clipvault` : ([gh](https://github.com/Rolv-Apneseth/clipvault)) Inspired by
cliphist, added features, written in rust. It's been working reliably and has
sped along my work flow as well.

`keepassxc` : ([gh](https://github.com/keepassxreboot/keepassxc)) I've seen
some rumors about security implementation issues with gnome-keyring.
Kde/plasma's keyring is flawed from a security standpoint, and I don't believe
it can function as a secret service provider --> keepassxc does. Seems to work
fine - I haven't really encountered any use-cases for the secret service stuff
yet.

> note: security is always a balance of accessibility vs hardening. For example,
> automatically unlocking the keyring at login effectively makes the keyring
> useless (right?).

`sunsetr` : ([gh](https://github.com/psi4j/sunsetr)) It just works, it's rust,
and it's been super helpful in early-setup. Thank you **psi4** for your
contribution. Really, it just worked right out of the box, and I can't even seem
to break it if I tried. Well done.

`xdg-desktop-portal-??` : Away with gnome! What I found is that xdg portals are
mostly agnostic, but each provide different feature sets. Portal-kde is fairly
complete and has everything needed to replace -gtk and -gnome. Apparently there
are some bugs with screen sharing or something (?) so -wlr is also included.
I also just like dolphin more than nautilus. And also, KDE seems to be a
fractured mess of dependencies.

Additionally, I heard Jonathan Riddell (KDE founder) has parted ways with KDE
recently due to changes in KDE's dev-team's workflow organization/communication
or something. Who really knows what goes on behind closed doors, but it seems
like kde is slightly changing some aspects of plasma desktop. I like what I see,
and also old+new kde programs are bundled up together in the same lists and
that's just annoying for one program to have gotten it's last commit 8+ years
ago and then the next package got an update just 4 days ago. I can see that
organization is just an issue all aroung.

Meanwhile, yazi will basically replace all open/save/browse file functions and
calls in one go, and it seems to be working well! It also shows photos in the
preview, so I don't really need to open koko or another photo viewer nearly as
frequently!

## Roadmap

- [x] core system functionality
- [x] get Niri working
- [x] de-gnomify desktop environment
- [x] custom kernel patches (settled with cachyos-kernel-lto from chaotic)
- [x] escape home manager
- [ ] set up encryption (and decryption options)
- [ ] shell: [quickshell](https://github.com/quickshell-mirror/quickshell) (<--progress)
- [ ] dynamic color theming (<--also progress)
- [ ] incorporate local ai tools
- [ ] create cohesion of all the parts! (pretty close)
- [x] get more sleep...

I would consider this flake in its late alpha stage. Bootable, workable, but
unless you're a tinkerer and you want to make some contributions, keep looking
elsewhere and come by a little later! :)

## Stay tuned
