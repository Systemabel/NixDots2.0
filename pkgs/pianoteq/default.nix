{pkgs ? import <nixpkgs> {}}:
with pkgs;
  stdenv.mkDerivation {
    pname = "pianoteq";
    version = "8.4.3"; # adjust to your version

    # To install pianoteq, you need to download the package from modartt.com
    # then extract it, and copy the folder x86-64bit directory into the src
    # folder shown below, then rebuild with this package enabled.
    src = ./src;

    nativeBuildInputs = [
      autoPatchelfHook
    ];

    buildInputs = [
      alsa-lib # libasound.so.2
      freetype # libfreetype.so.6
      libglvnd # libGL.so.1
      stdenv.cc.cc.lib # libgcc_s.so.1
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp "$src/x86-64bit/Pianoteq 8" $out/bin/pianoteq
      chmod +x $out/bin/pianoteq
    '';

    meta = with lib; {
      description = "Virtual piano instrument";
      homepage = "https://www.modartt.com/pianoteq";
      license = licenses.unfree;
      mainProgram = "pianoteq";
      platforms = ["x86_64-linux"];
    };
  }
