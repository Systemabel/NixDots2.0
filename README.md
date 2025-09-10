# NixDots2.0

# STATUS

Working:

- Niri working on "niri-unstable" from
  [sodiboo's niri flake](https://github.com/sodiboo/niri-flake).
- Niri de-gnomified
  - using **xdg-desktop-portal-kde** and **-wlr**
  - [keepassxc](https://github.com/keepassxreboot/keepassxc) instead of
    gnome-keyring
  - See `modules/catalogue.nix` for the full list of installed apps
    > note: `modules/catalogue.nix` is not actually used in the flake, it's just
    > something that I'm keeping around for clarity's sake.

Not working:

- Well, let's look at what _is_ working for now...

## This flake is a big combination of various tutorial flakes

- https://saylesss88.github.io/installation/index.html
- https://code.m3ta.dev/m3tam3re/nixcfg

---

## Dots-inspiration (thank you to y'all)

- [end-4 illogical impulse](https://github.com/end-4/dots-hyprland)
- [Caelestia dots](https://github.com/caelestia-dots/shell?tab=readme-ov-file)
- [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell)
- [kagurazakei's "Shizuru" flake](https://github.com/kagurazakei/Shizuru/tree/main)
- [Ly-sec's nix dots](https://github.com/Ly-sec/nixos) (old commits? as seen
  [here](https://www.reddit.com/r/unixporn/comments/1lmxjlx/niri_quickshell))
  who found inspo from
  - [Rexcrazy804's dots](https://github.com/Rexcrazy804/Zaphkiel)
  - [Noctalia's shell](https://github.com/noctalia-dev/noctalia-shell)

#### _Lots of different flakes and styles to build off of!_

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

`anyrun` : ([link](https://github.com/anyrun-org/anyrun)) Runs nice. Does nice
things. Written in rust.

`clipvault` : ([link](https://github.com/Rolv-Apneseth/clipvault)) Inspired by
cliphist, added features, written in rust.

`keepassxc` : ([link](https://github.com/keepassxreboot/keepassxc)) I've seen
some rumors about security implementation issues with gnome-keyring.
Kde/plasma's keyring is flawed from a security standpoint, and I don't believe
it can function as a secret service provider --> keepassxc does.

> note: security is always a balance of accessibility vs hardening. For example,
> automatically unlocking the keyring at login effectively makes the keyring
> useless (right?).

`sunsetr` : ([link](https://github.com/psi4j/sunsetr)) It just works, it's rust,
and it's been super helpful in early-setup. Thank you **psi4** for your
contribution.

`xdg-desktop-portal-kde` : Away with gnome! What I found is that xdg portals are
mostly agnostic, but each provide different feature sets. Portal-kde is fairly
complete and has everything needed to replace -gtk and -gnome. Apparently there
are some bugs with screen sharing or something (?) so -wlr is also included.
I also just like dolphin more than nautilus.

## Roadmap

- [x] core system functionality
- [x] get Niri working
- [x] de-gnomify desktop environment
- [ ] custom kernel patches ([tkg?](https://github.com/Frogging-Family/linux-tkg))
- [ ] escape home manager
- [ ] set up encryption (and decryption options)
- [ ] shell [quickshell](https://github.com/quickshell-mirror/quickshell)
- [ ] dynamic color theming
- [ ] incorporate local ai tools
- [ ] create cohesion of all the parts!

# Stay tuned...
