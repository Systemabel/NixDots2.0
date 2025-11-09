{pkgs ? import <nixpkgs> {}}:
(pkgs.buildFHSEnv {
  name = "android-kernel-env";

  targetPkgs = pkgs:
    with pkgs; [
      bc
      bison
      ccache
      curl
      flex
      git-lfs
      gnupg
      gperf
      imagemagick
      lz4
      ncurses
      ncurses6
      readline
      zlib
      libxcrypt
      libxcrypt-legacy
      libxml2
      libxslt
      lzop
      payload-dumper-go
      pngcrush
      python3
      rsync
      schedtool
      squashfsTools
      unzip
      zip
      openssl
      wxGTK32
      SDL
    ];

  runScript = "bash";

  profile = ''
    export PATH=~/Projects/Android/oneplus/bin:$PATH
    export NIX_BUILD_CORES=6
  '';
}).env
