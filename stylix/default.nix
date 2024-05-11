{ pkgs, inputs, ... }:
{

  imports = [ inputs.stylix.nixosModules.stylix ];

  environment.systemPackages = with pkgs; [
    everforest-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  environment.pathsToLink = [
    "/share/Kvantum"
    "/share/themes"
    "/share/icons"
  ];

  stylix = {
    homeManagerIntegration.followSystem = true;
    image = "${pkgs.everforest-theme}/share/wallpaper/Everforest/ocean_front_1.png";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    polarity = "dark";
    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        name = "M+2 Nerd Font";
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "Hack"
              "MPlus"
              "NerdFontsSymbolsOnly"
            ];
          }
        );
      };
      sansSerif = {
        name = "M+2 Nerd Font";
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "Hack"
              "MPlus"
              "NerdFontsSymbolsOnly"
            ];
          }
        );
      };
      monospace = {
        name = "M+CodeLat60 Nerd Font Mono";
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "Hack"
              "MPlus"
              "NerdFontsSymbolsOnly"
            ];
          }
        );
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    opacity = {
      desktop = 0.85;
      popups = 0.85;
      terminal = 0.9;
    };
    targets = {
      gtk.enable = true;
      plymouth.logoAnimated = false;
    };
  };
}
