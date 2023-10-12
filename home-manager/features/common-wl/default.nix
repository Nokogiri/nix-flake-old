{ config, pkgs, ... }: {
  imports = [
    #./avizo.nix
    ./fuzzel.nix
    ./gammastep.nix
    #./obs-studio.nix
    ./swaylock.nix
    ./swaync.nix
    ./swayosd.nix
    ./waybar
    ./wezterm
    ./wvkbd.nix
  ];

  home.packages = with pkgs; [
    cliphist
    imv
    rofi-wayland
    swayidle
    wl-clipboard
    wlr-randr
  ];

  home.sessionVariables = {
    BEMENU_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_PLUGIN_PATH =
      "$QT_PLUGIN_PATH:/home/nokogiri/.nix-profile/lib/qt-6/plugins";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Nordzy-cursors-white";
  };

  systemd.user.sessionVariables = {
    PATH =
      "/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORM = "${config.home.sessionVariables.QT_QPA_PLATFORM}";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME =
      "${config.home.sessionVariables.QT_QPA_PLATFORMTHEME}";
    XCURSOR_SIZE = "${config.home.sessionVariables.XCURSOR_SIZE}";
    XCURSOR_THEME = "${config.home.sessionVariables.XCURSOR_THEME}";
  };
}
