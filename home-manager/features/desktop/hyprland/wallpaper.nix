{ pkgs, ... }: {

  home.packages = [ pkgs.swaybg ];

  xdg.configFile."hypr/wallpaper.png".source = ./hyprpaper/Totoro-Sapphire-Night.png;

  systemd.user.services.swaybg = {
    Unit = { Description = "swaybg"; };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i /home/nokogiri/.config/hypr/wallpaper.png -m fill";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
