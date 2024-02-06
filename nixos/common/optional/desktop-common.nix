{ pkgs, inputs, ... }: {
  security.pam.services = {
    swaylock = {
      name = "swaylock";
      text = ''
        auth            sufficient      pam_unix.so try_first_pass likeauth nullok
        auth            sufficient      pam_fprintd.so
      '';
    };
    #greetd = { enableGnomeKeyring = true; };
  };

  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      nerdfonts = nerdfonts.override { fonts = [ "Hack" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; };
    };

  fonts.packages = with pkgs; [
    dejavu_fonts
    hack-font
    jetbrains-mono
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
        serif = [ " JetBrainsMono Nerd Font Propo" ];
        sansSerif = [ " JetBrainsMono Nerd Font Propo" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
    config.common.default = "*";
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    # themepkgs
    nordzy-cursor-theme
    dracula-theme
    dracula-icon-theme
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
}
