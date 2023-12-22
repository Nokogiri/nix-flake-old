{ pkgs, config, ...}:{

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.local/share/wallpaper/FireWatch_1.png
    preload = ~/.local/share/wallpaper/FireWatch_2.png
    preload = ~/.local/share/wallpaper/FireWatch.png

    wallpaper = eDP-1,~/.local/share/wallpaper/FireWatch.png
  '';

  systemd.user.services.hyprpaper = {
    Unit = { Description = "hyprpaper"; };
    Service = { 
      Type = "simple";
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
      Restart = "on-failure";
    };
  };
}
