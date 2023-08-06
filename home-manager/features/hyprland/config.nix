{ config, pkgs, ...}:{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 7;
      gaps_out = 10;
      border_size = 0;
      no_cursor_warps = true;
      no_border_on_floating = true;
      cursor_inactive_timeout = 4;
    };

    decoration = {
      active_opacity = 1.0;
      inactive_opacity = 0.8;
      fullscreen_opacity = 1.0;
      roundig = 6;
      
      drop_shadow = true;
      shadow_range = 24;
      shadow_offset = "3 3";
      col = { 
        shadow = "0x44000000";
        shadow_inactive = "0x66000000";
      };
      
      blur = {
        size = 3;
        passes = 1;
        new_optimizations = true;
      };
    };

    animations = {
      enable = true;

      bezier = [ 
        "easein,0.11, 0, 0.5, 0"
        "easeout,0.5, 1, 0.89, 1"
        "easeinout,0.45, 0, 0.55, 1"
        "myBezier, 0.05, 0.9, 0.1, 1.05"
      ];

      animation = [
        "windows, 1, 3, myBezier"
        "windowsOut, 1, 3, default, popin 10%"
        "border, 1, 5, default"
        "borderangle, 1, 4, default"
        "fade, 1, 3, default"
        "workspaces, 1, 2, default"
      ];
    };
    
    misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
    };

    binds = {
      workspace_back_and_forth = true;
    };

    input = {
      kb_layout = "us,de";
      kb_variant = "altgr-intl,";
      kb_options = "grp:alt_space_toggle";

      follow_mouse = true;

      touchpad = {
        disable_while_typing = true;
      };
    };

    exec-once = [
      "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
      "${pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store"
    ];

    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];

    bind = [
      # Programs
      "SUPER,Return,exec,${pkgs.kitty}/bin/kitty"
      "SUPER,W,exec,${pkgs.swaynotificationcenter}/bin/swaync-client --hide-latest"

      # Media-keys 
      ",XF86MonBrightnessUp,exec,lightctl +"
      ",XF86MonBrightnessDown,exec,lightctl -"

      ",XF86AudioRaiseVolume,exec,volumectl +"
      ",XF86AudioLowerVolume,exec,volumectl -"
      ",XF86AudioMute,exec,volumectl %"
    ];

    windowrulev2 = [
      "workspace 2 silent,class:^(firefox)$"
      "workspace 3 silent,class:^(mpv)$"
      "workspace 6 silent,class:^(steam)$,title:^(Steam)$"
      "workspace 6 silent,class:^(steam)$,title:^(Steam Big Picture Mode)$"
      "workspace 7 silent,title:^(Spotify)$"
      
      "float,center,size=60%,title:^(.*Picture-in-Picture.*)$,class:^(firefox)$"
      
      "size 80%,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
      "center,class:^(org.kde.polkit-kde-authentication-agent-1)$title:^(Authentication Required — PolicyKit1 KDE Agent)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$"
    ];
  };
}
