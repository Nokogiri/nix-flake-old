{
  imports = [
    ../wlr-utils/wvkbd.nix
  ];

  systemd.user.services.wvkbd = {
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
