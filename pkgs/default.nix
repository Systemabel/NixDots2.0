{pkgs, ...}: {
  # Define your custom packages here
  # my-package = pkgs.callPackage ./my-package {};
  clipvault = pkgs.callPackage ./clipvault {};
}
