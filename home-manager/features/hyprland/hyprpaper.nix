{ pkgs, ... }: {

  home.packages = [ pkgs.hyprpaper ];

  xdg.configFile."hypr/paper".source = ./wallpaper;

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.config/hypr/paper/Totoro-Dracula.png
    wallpaper = ,~/.config/hypr/paper/Totoro-Dracula.png
  '';

  systemd.user.services.hyprpaper = {
    Unit = { Description = "hyprpaper"; };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "on-failure";
    };
    Install = { WantedBy = [ "hyprland-session.target" ]; };
  };
}
