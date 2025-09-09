{pkgs ? import <nixpkgs> {}}:
with pkgs;
  rustPlatform.buildRustPackage rec {
    pname = "clipvault";
    version = "1.0.3"; # as of Sep 3, 2025
    src = pkgs.fetchFromGitHub {
      owner = "Rolv-Apneseth";
      repo = "clipvault";
      rev = "v${version}";
      sha256 = "sha256-MWm/4Vy6JSJrZCdTHYWK4CN94LyucXFWdx6zYfXSrWg=";
    };

    cargoHash = "sha256-NRBTGqz38PaGmWbmsZCrFO8r7g2QEt31Tcj1jfngDMo=";

    # Tests write to a logs dir; sandbox blocks it --> disable.
    doCheck = false;

    meta = with lib; {
      description = "Clipboard history manager for Wayland";
      homepage = "https://github.com/Rolv-Apneseth/clipvault";
      license = "licenses.agpl30Only";
      mainProgram = "clipvault";
      platforms = platforms.linux;
    };
  }
