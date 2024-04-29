{ pkgs, inputs, ... }:
{

  security.pam.services.swaylock.fprintAuth = true;

  security.pam.services.hyprlock = {
    text = "auth include login";
  };

  #nixpkgs.config.packageOverrides =
  #  pkgs: with pkgs; {
  #    nerdfonts = nerdfonts.override {
  #      fonts = [
  #        "Hack"
  #        "MPlus"
  #        "NerdFontsSymbolsOnly"
  #      ];
  #    };
  #  };

  environment.systemPackages = with pkgs; [
    dracula-theme
    dracula-icon-theme
  ];

  fonts.packages = with pkgs; [
    dejavu_fonts
    #hack-font
    #nerdfonts
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
    };
  };

  gtk.iconCache.enable = true;

  #qt.style = "kvantum";

  programs = {
    dconf.enable = true;
    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };

  # better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    flatpak.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    upower.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config = {
    common = {
      default = [ "gtk" ];
    };
  };
}
