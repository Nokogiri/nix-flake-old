{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  nixpkgs.config.packageOverrides =
    pkgs: with pkgs; {
      steam = steam.override {
        extraPkgs =
          pkgs: with pkgs; [
            gst_all_1.gst-vaapi
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-libav
            gamescope
            gamemode
            fribidi
            mangohud
            libgdiplus
            zlib
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            SDL2
            libkrb5
            keyutils
            xdg-user-dirs
            inputs.extest.packages.x86_64-linux.default
            wget
            yad
          ];
        extraProfile = ''
          export GSETTINGS_SCHEMA_DIR="${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}/glib-2.0/schemas/"
        '';
      };
    };
  home.packages = with pkgs; [
    steam
    steam-run
    steam-rom-manager
    (pkgs.writeShellScriptBin "steam-extest" ''
      LD_PRELOAD=${inputs.extest.packages.x86_64-linux.default}/lib/libextest.so steam
    '')
  ];

  xdg.desktopEntries = {
    "steam-extest" = {
      exec = "steam-extest";
      name = "Steam Extest";
      icon = "steam";
      type = "Application";
    };
  };
}
