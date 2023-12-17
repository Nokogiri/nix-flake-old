{ pkgs, inputs, ... }: {
  security.pam.services = {
    swaylock = {
      name = "swaylock";
      text = ''
        auth            sufficient      pam_unix.so try_first_pass likeauth nullok
        auth            sufficient      pam_fprintd.so
      '';
    };
    greetd = { enableGnomeKeyring = true; };
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

  environment.pathsToLink =
    [ "/share/Kvantum" "/share/kservicetypes5" "/share/kservices5" ];

  gtk.iconCache.enable = true;

  qt.style = "Kvantum-Dark";

  programs = { 
    dconf.enable = true;
  };

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
