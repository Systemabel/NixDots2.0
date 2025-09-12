{pkgs, ...}: {
  # Define your custom packages here
  # my-package = pkgs.callPackage ./my-package {};
  # TODO auto-updater app?
  # TODO zen-browser
  clipvault = pkgs.callPackage ./clipvault {};
}
