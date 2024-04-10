{ pkgs, ... }:
{
  home.packages = with pkgs; [ playerctl ];
  services.playerctld = {
    enable = false;
  };
  #systemd.user.services.playerctld = {
  #  Unit = { Description = "MPRIS media player daemon"; };
  #  Service = {
  #    Type = "dbus";
  #    BusName = "org.mpris.MediaPlayer2.playerctld";
  ##    ExecStart = "${pkgs.playerctl}/bin/playerctld";
  #  };
  #  Install = { WantedBy = [ "hyprland-session.target" ]; };
  #};
}
