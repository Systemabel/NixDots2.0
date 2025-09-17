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
    theme = lib.mkForce spicePkgs.themes.hazy;

    # colorScheme = "custom";

    # customColorScheme = {
    # button = accent;
    # button-active = accent;
    # tab-active = accent;
    # player = background;
    # main = background;
    # sidebar = background;
    # };

    enabledExtensions = with spicePkgs.extensions; [
      betterGenres
      fullAppDisplay
      hidePodcasts
      historyShortcut
      keyboardShortcut
      lastfm
      listPlaylistsWithSong
      oldLikeButton
      oldSidebar
      playlistIcons
      playlistIntersection
      shuffle
    ];
  };
}
