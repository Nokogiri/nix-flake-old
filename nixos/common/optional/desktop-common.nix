{ pkgs, inputs, ... }: {

  security.pam.services.swaylock.fprintAuth = true;

  security.pam.services.hyprlock = {};
  
  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts = nerdfonts.override { fonts = [ "Hack" "NerdFontsSymbolsOnly" ]; };
    };
  fonts.packages = with pkgs; [
    dejavu_fonts
    hack-font
    nerdfonts
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
        serif = [ "Hack Nerd Font Propo" ];
        sansSerif = [ "Hack Nerd Font Propo" ];
        monospace = [ "Hack Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
  
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    # themepkgs
    #nordzy-cursor-theme
    #dracula-theme
    #dracula-icon-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  environment.pathsToLink = [ "/share/Kvantum" "/share/kservicetypes5" "/share/kservices5" ];

  gtk.iconCache.enable = true;

  qt.style = "kvantum";

  programs = {
    dconf.enable = true;
    gamemode = {
      enable = true;
      enableRenice = true;
    };
    hyprland.enable = true;
  };

  # better for steam proton games
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  #xdg.portal.enable = true;
  
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
}
