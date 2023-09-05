{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts =
        nerdfonts.override { fonts = [ "Hack" "JetBrainsMono" "SourceCodePro" ]; };
    };

  fonts.packages = with pkgs; [
    nerdfonts
    dejavu_fonts
    hack-font
    jetbrains-mono
    lato
    twemoji-color-font
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
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
        serif = [ "Lato" ];
        sansSerif = [ "Lato" ];
        monospace = [ "Hack" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
