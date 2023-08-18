{ pkgs, inputs, config, ... }:
let
  catTheme = "Catppuccin-Frappe-Standard-Sapphire-dark";
  schema = pkgs.gsettings-desktop-schemas;
  datadir = "${schema}/share/gsettings-schemas/${schema.name}";
in {
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "configure-gtk" ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema gtk-theme '${config.gtk.theme.name}'
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema icon-theme '${config.gtk.iconTheme.name}'
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema cursor-theme '${config.gtk.cursorTheme.name}'
    '')
    dracula-theme
    dracula-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    cursorTheme = { name = "Nordzy-cursors"; };
    font = {
      name = "JetBrainsMonoNL Nerd Font Propo";
      size = 10;
    };
    iconTheme = { name = "Dracula"; };
    theme = { name = "Dracula"; };
    gtk2 = {
      extraConfig = ''
        gtk-toolbar-style=GTK_TOOLBAR_ICONS
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-button-images=0
        gtk-menu-images=1
      '';
    };
    gtk3 = {
      extraConfig = {
        gtk-button-images = false;
        gtk-menu-images = true;
        gtk-enable-event-sounds = false;
        gtk-enable-animations = true;
        gtk-application-prefer-dark-theme = true;

      }; 
    };
  home.file.".config/gtk-4.0/gtk.css".source =
  };
    "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk.css";
  home.file.".config/gtk-4.0/gtk-dark.css".source =
    "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk-dark.css";
  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/assets";
  };

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    size = 16;
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    x11.defaultCursor = "left_ptr";
  };

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';
}
