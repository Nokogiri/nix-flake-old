{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts = nerdfonts.override {
        fonts = [ "FiraCode" "JetBrainsMono" ];
      };
    };

  fonts.packages = with pkgs; [
    nerdfonts
    fira
    fira-code
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
        serif = [ "FiraCode Nerd Font" ];
        sansSerif = [ "FiraCode Nerd Font" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
