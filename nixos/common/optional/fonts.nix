{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts =
        nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    };

  fonts.packages = with pkgs; [
    nerdfonts
    jetbrains-mono
    dejavu_fonts
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
        serif = [ "JetBrainsMono Nerd Font Propo" ];
        sansSerif = [ "JetBrainsMono Nerd Font Propo" ];
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
