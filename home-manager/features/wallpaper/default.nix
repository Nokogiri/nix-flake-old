{ config, pkgs, ... }: {

  home.packages = [ pkgs.swaybg ];

  xdg.dataFile."wallpaper.png".source =
    ./Totoro-Dracula.png;

  systemd.user.services.swaybg = {
    Unit = { Description = "swaybg"; };
    Service = {
      Type = "simple";
      ExecStart =
        "${pkgs.swaybg}/bin/swaybg -i /home/nokogiri/.local/share/wallpaper.png -m fill";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
