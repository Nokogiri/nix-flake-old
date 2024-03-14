{ config, pkgs, ... }: {

  imports = [
    ./firefox
    ./gammastep.nix
    ./gpg-agent.nix
    ./nwg/drawer.nix
    #./obs-studio.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./rbw.nix
    ./rofi
    ./style.nix
    ./udisks.nix
    ./vscode.nix
    ./wezterm
    ./wofi
    ./wvkbd.nix
    ./xdg-portal.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [ cliphist swayimg wl-clipboard xdg_utils lxqt.pcmanfm-qt ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    NO_AT_BRIDGE = "1";
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_PLUGIN_PATH = "$QT_PLUGIN_PATH:/home/nokogiri/.nix-profile/lib/qt-6/plugins";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Dracula-cursors";
  };

  systemd.user.sessionVariables = {
    PATH =
      "/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORM = "${config.home.sessionVariables.QT_QPA_PLATFORM}";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORMTHEME = "${config.home.sessionVariables.QT_QPA_PLATFORMTHEME}";
    XCURSOR_SIZE = "${config.home.sessionVariables.XCURSOR_SIZE}";
    XCURSOR_THEME = "${config.home.sessionVariables.XCURSOR_THEME}";
  };
}
