{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    andromeda-gtk-theme
    ant-theme
    dracula-icon-theme
    everforest-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  qt.style.name = "Kvantum-Dark";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.everforest-theme;
    };
    theme = {
      name = "Everforest-Dark-BL";
      package = pkgs.everforest-theme;
    };
  };

  #home.file.".config/Kvantum/Everforest" = {
  #  source = "${pkgs.everforest-theme}/share/Kvantum/Everforest-Kvantum";
  #  recursive = false;
  #};
  #home.file.".config/gtk-4.0/gtk.css".source = "${pkgs.everforest-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/gtk.css";
  #home.file.".config/gtk-4.0/gtk-dark.css".source = "${pkgs.everforest-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/gtk-dark.css";
  #home.file.".config/gtk-4.0/assets" = {
  #  recursive = true;
  #  source = "${pkgs.everforest-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/assets";
  #};
  stylix.targets = {
    gtk.enable = false;
    kde.enable = false;
    nixvim.enable = false;
    rofi.enable = false;
    vim.enable = false;
    waybar.enable = false;
  };
}
