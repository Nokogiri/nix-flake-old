{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides =
    pkgs: with pkgs; {
      nerdfonts = nerdfonts.override {
        fonts = [
          "Hack"
          "NerdFontsSymbolsOnly"
        ];
      };
    };

  fonts.packages = with pkgs; [
    dejavu_fonts
    hack-font
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    twemoji-color-font
    weather-icons
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "Hack Nerd Font Propo" ];
        sansSerif = [ "Hack Nerd Font Propo" ];
        monospace = [ "Hack Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
