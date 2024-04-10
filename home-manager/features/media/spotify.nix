{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "SpotifyWM";
      exec = "spotify";
      icon = "spotify";
      terminal = false;
    };
  };
  programs.spicetify = {
    windowManagerPatch = false;
    enable = true;
    theme = spicePkgs.themes.Dracula;
    enabledCustomApps = with spicePkgs.apps; [ lyrics-plus ];
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      popupLyrics
      hidePodcasts
      fullAppDisplayMod
    ];
  };
}
