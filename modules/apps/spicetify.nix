# Spicetify is a spotify client customizer
{
  pkgs,
  # config,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  programs.spicetify = {
    enable = lib.mkDefault true;

    # enabledExtensions = with spicePkgs.extensions; [
    # betterGenres
    # history
    # keyboardShortcut
    # lastfm
    # listPlaylistsWithSong
    # oldLikeButton
    # # oldSidebar
    # # playlistIcons
    # playlistIntersection
    # shuffle
    # ];

    theme = spicePkgs.themes.default;
  };
}
