{ pkgs, config, ...}:{

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.local/share/wallpaper/FireWatch_1.png
    preload = ~/.local/share/wallpaper/FireWatch_2.png
    preload = ~/.local/share/wallpaper/FireWatch.png

    wallpaper = eDP-1,~/.local/share/wallpaper/FireWatch.png
  '';

  systemd.user.timers = {
    morning-wp = {
      Timer = {
        OnCalendar = "*-*-* 6:00:00";
        Persistent = true;
      };
      Install = { WantedBy = [ "hyprland-session.target" ]; };
    };
  };
  systemd.user.services = {
    hyprpaper = {
      Unit = { Description = "Hyprpaper"; };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
        Restart = "on-failure";
      };
    };
    morning-wp = {
      Unit = { Description = "Wallpaper Morning"; };
      Service = { 
        Type = "oneshot";
        ExecStart = "${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper \"eDP-1,~/.local/share/wallpaper/FireWatch.png\"";
        Restart = "on-failure";
      };
    };
  };
}
