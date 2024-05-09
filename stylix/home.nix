{
  pkgs,
  config,
  ...
}:
{
  #home.packages = with pkgs; [
  #  everforest-theme
  #  libsForQt5.qt5ct
  #  qt6Packages.qt6ct
  #  libsForQt5.qtstyleplugin-kvantum
  #  qt6Packages.qtstyleplugin-kvantum
  #];

  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=${config.gtk.cursorTheme.name}
  '';

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-theme;
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };
    #theme = {
    #  name = "Everforest-Dark-BL";
    #  package = pkgs.everforest-theme;
    #};
  };

  stylix.targets = {
    gtk.enable = true;
    kde.enable = false;
    kitty.enable = false;
    mangohud.enable = false;

    nixvim.enable = false;
    rofi.enable = false;
    vim.enable = false;
    waybar.enable = false;
  };
}
