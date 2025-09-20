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
    theme = spicePkgs.themes.dribbblish;
    # theme = {
    #   name = "Hazy";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "Astromations";
    #     repo = "Hazy";
    #     rev = "main";
    #     hash = "sha256-pbl+b71IAObgZk8gVzYoPVaHkHRk4wL+fut6kJEzEOo=";
    #   };

    #   injectCss = true;
    #   injectThemeJs = true;
    #   # replaceColors = true;
    #   overwriteAssets = true;
    # };

    colorScheme = "lunar";
    # colorScheme = "Base";

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
