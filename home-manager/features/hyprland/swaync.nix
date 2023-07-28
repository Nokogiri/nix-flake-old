{
  imports = [
    ../wlr-utils/swaync.nix
  ];
  systemd.user.services.swaynotificationcenter = {
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
