{
  pkgs,
  inputs,
  config,
  ...
}:
let
  #  #catTheme = "Catppuccin-Frappe-Standard-Sapphire-dark";
  schema = pkgs.gsettings-desktop-schemas;
  datadir = "${schema}/share/gsettings-schemas/${schema.name}";
in
{
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "configure-gtk" ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema gtk-theme '${config.gtk.theme.name}'
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema icon-theme '${config.gtk.iconTheme.name}'
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema cursor-theme '${config.gtk.cursorTheme.name}'
      ${pkgs.glib.bin}/bin/gsettings set $gnome_schema color-scheme prefer-dark
    '')
    #dracula-theme
    andromeda-gtk-theme
    ant-theme
    dracula-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Dracula-cursors";
    };
    #  font = {
    #    name = "M+2 Nerd Font";
    #    size = 11.5;
    #  };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    theme = {
      name = "Andromeda";
      package = pkgs.andromeda-gtk-theme;
    };
    #gtk2 = {
    #  extraConfig = ''
    #    gtk-toolbar-style=GTK_TOOLBAR_ICONS
    #    gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
    #    gtk-button-images=0
    #    gtk-menu-images=1
    #  '';
    #};
    #gtk3 = {
    #  extraConfig = {
    #    gtk-button-images = false;
    #    gtk-menu-images = true;
    #    gtk-enable-event-sounds = false;
    #    gtk-enable-animations = true;
    #    gtk-application-prefer-dark-theme = true;
    #  };
    #};
  };
  #home.file.".config/gtk-4.0/gtk.css".source =
  #  "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk.css";
  #home.file.".config/gtk-4.0/gtk-dark.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk-dark.css";
  #home.file.".config/gtk-3.0/gtk.css".text = ''
  ##  .window-frame {box-shadow: none;}
  #'';
  # for flatpaks
  #home.file.".themes/Dracula" = {
  #  recursive = true;
  #  source = "${pkgs.dracula-theme}/share/themes/Dracula";
  #};

  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    size = 24;
    #name = "Dracula-cursors";
    #package = pkgs.nordzy-cursor-theme;
    x11.defaultCursor = "left_ptr";
  };

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';
}
