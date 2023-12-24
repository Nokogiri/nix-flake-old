{ pkgs, config, ...}:{

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.local/share/wallpaper/FireWatch_1.png
    preload = ~/.local/share/wallpaper/FireWatch_2.png
    preload = ~/.local/share/wallpaper/FireWatch.png

    wallpaper = eDP-1,~/.local/share/wallpaper/FireWatch.png
  '';

  systemd.user.timers = {
    wall1 = {
      Timer = {
        OnCalendar = "*-*-* 6:00:00";
        Persistent = true;
      };
    };
  };
  systemd.user.services = {
    wall1 = {
      Unit = { Description = "hyprpaper"; };
      Service = { 
        Type = "oneshot";
        ExecStart = "hyprctl hyprpaper wallpaper \"eDP-1,~/.local/share/wallpaper/FireWatch.png\"";
        Restart = "on-failure";
      };
    };
  };
}
