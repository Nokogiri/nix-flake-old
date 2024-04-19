{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hy3.packages.x86_64-linux.hy3 ];
    extraConfig = ''
      general {
        gaps_in=7
        gaps_out=10
        border_size=0
        col.active_border=0xffAAAAAA
        col.inactive_border=0xff666666
        layout = hy3
        no_cursor_warps=true
        no_border_on_floating=true
        cursor_inactive_timeout=0
      }

      monitor=eDP-1,1920x1200@47.999,auto,1

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
        workspace_swipe_distance = 130
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_min_speed_to_force = 20
        workspace_swipe_create_new = false 
      }

      decoration {
         active_opacity=1.0
         inactive_opacity=0.8
         fullscreen_opacity=1.0
         rounding=6
         drop_shadow=true
         shadow_range=24
         shadow_offset=3 3
         col.shadow=0x44000000
         col.shadow_inactive=0x66000000
         blur {
           size = 3
           passes = 1
        }
      }

      animations {
        enabled=true

        bezier=easein,0.11, 0, 0.5, 0
        bezier=easeout,0.5, 1, 0.89, 1
        bezier=easeinout,0.45, 0, 0.55, 1

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 3, myBezier
        animation = windowsOut, 1, 3, default, popin 10%
        animation = border, 1, 5, default
        animation = borderangle, 1, 4, default
        animation = fade, 1, 3, default
        animation = workspaces, 1, 2, default
      }

      misc {
        disable_hyprland_logo=true
        disable_splash_rendering=true
        vfr=true
      }

      debug {
        overlay=false
        disable_logs=false
        enable_stdout_logs=false
      }
      binds {
        workspace_back_and_forth = true
      }
      input {
        kb_layout=us,de
        kb_variant=altgr-intl,
        kb_options=grp:alt_space_toggle
        follow_mouse=1
        touchpad {
          disable_while_typing = false
          natural_scroll = false
        }
      }
      device {
        name = wacom-hid-49c8-finger
        output = eDP-1
        enabled = true
      }
      device {
         name = wacom-hid-49c8-pen
         output=eDP-1
         enabled=true
      }

      # Startup
      exec-once = ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd --all
      exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store

      # Mouse binding
      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow

      # Program bindings
      bind=SUPER,Return,exec,${pkgs.kitty}/bin/kitty
      bind=SUPER,w,exec,swaync-client -t
      #bind=SUPER,v,exec,$TERMINAL $SHELL -ic nvim
      #bind=SUPER,m,exec,$TERMINAL $SHELL -ic neomutt
      #bind=SUPER,b,exec,firefox

      bind=SUPER,p,exec,pkill -9 rofi || ${pkgs.rofi-wayland}/bin/rofi -show drun
      bind=SUPER,i,exec,cliphist list | ${pkgs.rofi-wayland}/bin/rofi -dmenu | cliphist decode | wl-copy
      #bind=,Scroll_Lock,exec,pass-wofi # fn+k
      #bind=,XF86Calculator,exec,pass-wofi # fn+f12

      # Toggle waybar
      bind=,XF86Tools,exec,pkill -USR1 waybar # profile button

      # Lock screen
      bind=,XF86Launch5,exec,swaylock -S
      bind=,XF86Launch4,exec,swaylock -S

      # Screenshots
      bind=,Print,exec,grimblast --notify copy output
      bind=SHIFT,Print,exec,grimblast --notify copy active
      bind=CONTROL,Print,exec,grimblast --notify copy screen
      bind=SUPER,Print,exec,grimblast --notify copy window
      bind=ALT,Print,exec,grimblast --notify copy area

      # Keyboard controls (brightness, media, sound, etc)
      bind=,XF86MonBrightnessUp,exec,${pkgs.swayosd}/bin/swayosd-client --brightness raise
      bind=,XF86MonBrightnessDown,exec,${pkgs.swayosd}/bin/swayosd-client --brightness lower

      bind=ALT,XF86AudioRaiseVolume,exec,playerctl next
      bind=ALT,XF86AudioLowerVolume,exec,playerctl previous
      bind=,XF86AudioPlay,exec,playerctl play-pause
      bind=,CF86AudioPause,exec,playerctl play-pause
      bind=,XF86AudioStop,exec,playerctl stop
      bind=ALT,XF86AudioNext,exec,playerctld shift
      bind=ALT,XF86AudioPrev,exec,playerctld unshift
      bind=ALT,XF86AudioPlay,exec,systemctl --user restart playerctld
      bind=SUPER,XF86AudioPlay,exec,$TERMINAL $SHELL -ic lyrics

      bind=,XF86AudioRaiseVolume,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume raise
      bind=,XF86AudioLowerVolume,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume lower
      bind=,XF86AudioMute,exec,${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle

      bind=SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
      bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle


      # Window manager controls
      bind=SUPERSHIFT,q,killactive
      bind=SUPERSHIFT,e,exit

      bind=SUPER,t,hy3:makegroup,tab
      bind=SUPER,s,togglesplit
      bind=SUPER,f,fullscreen,1
      bind=SUPERSHIFT,f,fullscreen,0
      bind=SUPERSHIFT,space,togglefloating

      bind=SUPER,minus,splitratio,-0.25
      bind=SUPERSHIFT,minus,splitratio,-0.3333333

      bind=SUPER,equal,splitratio,0.25
      bind=SUPERSHIFT,equal,splitratio,0.3333333

      bind=SUPER,g,togglegroup
      bind=SUPER,apostrophe,changegroupactive,f
      bind=SUPERSHIFT,apostrophe,changegroupactive,b

      bindn=,mouse:272,hy3:focustab,mouse

      bind=SUPER,left,hy3:movefocus,l
      bind=SUPER,right,hy3:movefocus,r
      bind=SUPER,up,hy3:movefocus,u
      bind=SUPER,down,hy3:movefocus,d

      bind=SUPERSHIFT,left,hy3:movewindow,l
      bind=SUPERSHIFT,right,hy3:movewindow,r
      bind=SUPERSHIFT,up,hy3:movewindow,u
      bind=SUPERSHIFT,down,hy3:movewindow,d

      bind=SUPERCONTROL,left,focusmonitor,l
      bind=SUPERCONTROL,right,focusmonitor,r
      bind=SUPERCONTROL,up,focusmonitor,u
      bind=SUPERCONTROL,down,focusmonitor,d

      bind=SUPERCONTROL,1,focusmonitor,eDP-1
      bind=SUPERCONTROL,2,focusmonitor,DP-1


      bind=SUPERCONTROLSHIFT,left,movewindow,mon:l
      bind=SUPERCONTROLSHIFT,right,movewindow,mon:r
      bind=SUPERCONTROLSHIFT,up,movewindow,mon:u
      bind=SUPERCONTROLSHIFT,down,movewindow,mon:d

      bind=SUPERCONTROLSHIFT,1,movewindow,mon:DP-1
      bind=SUPERCONTROLSHIFT,2,movewindow,mon:DP-2
      bind=SUPERCONTROLSHIFT,3,movewindow,mon:DP-3

      bind=SUPERALT,left,movecurrentworkspacetomonitor,l
      bind=SUPERALT,right,movecurrentworkspacetomonitor,r
      bind=SUPERALT,up,movecurrentworkspacetomonitor,u
      bind=SUPERALT,down,movecurrentworkspacetomonitor,d

      bind=SUPER,u,togglespecialworkspace
      bind=SUPERSHIFT,u,movetoworkspace,special

      bind=SUPER,1,workspace,01
      bind=SUPER,2,workspace,02
      bind=SUPER,3,workspace,03
      bind=SUPER,4,workspace,04
      bind=SUPER,5,workspace,05
      bind=SUPER,6,workspace,06
      bind=SUPER,7,workspace,07
      bind=SUPER,8,workspace,08
      bind=SUPER,9,workspace,09

      bind=SUPERSHIFT,1,movetoworkspacesilent,01
      bind=SUPERSHIFT,2,movetoworkspacesilent,02
      bind=SUPERSHIFT,3,movetoworkspacesilent,03
      bind=SUPERSHIFT,4,movetoworkspacesilent,04
      bind=SUPERSHIFT,5,movetoworkspacesilent,05
      bind=SUPERSHIFT,6,movetoworkspacesilent,06
      bind=SUPERSHIFT,7,movetoworkspacesilent,07
      bind=SUPERSHIFT,8,movetoworkspacesilent,08
      bind=SUPERSHIFT,9,movetoworkspacesilent,09
      windowrulev2 = workspace 2 silent,class:^(firefox)$


      windowrule = group set,^(mFoot)$

      windowrulev2 = size 80%,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$
      windowrulev2 = center,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$
      windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$,title:^(Authentication Required — PolicyKit1 KDE Agent)$

      windowrulev2 = float,class:^(electron)$,title:^(Select Executable)$
      windowrulev2 = center,class:^(electron)$,title:^(Select Executable)$
      windowrulev2 = size 60%,class:^(electron)$,title:^(Select Executable)$


      windowrulev2 = center,class:^(xdg-desktop-portal-gtk)$,title:^(Open With…)$
      windowrulev2 = float,center,size=60%,title:^(.*Picture-in-Picture.*)$,class:^(firefox)$

      windowrulev2 = workspace 3 silent,class:^(mpv)$

      windowrulev2 = workspace 6 silent,class:^(steam)$,title:^(Steam)$
      windowrulev2 = workspace 6 silent,class:^(steam)$,title:^(Steam Big Picture Mode)$
      windowrulev2 = pseudo,class:^(steam)$,title:^(Steam Big Picture Mode)$

      windowrulev2 = float,class:^(pavucontrol-qt)$
      windowrulev2 = center,class:^(pavucontrol-qt)$
      windowrulev2 = size 66%,class:^(pavucontrol-qt)$

      windowrulev2 = float,title:^(Select EXE to Run)$

      windowrulev2 = float,opaque,noblur,class:^(Xdg-desktop-portal-gtk)$,title:^(Install Files)$

      #windowrulev2 = forceinput,class:^(.gamescope-wrapped)$

      windowrulev2 = workspace 7 silent,title:^(Spotify)$
      #windowrulev2 = fullscreen,opaque,noblur,class:^(gamescope)$
      layerrule=blur, gtk-layer-shell

      # Center Stuff
      windowrulev2 = center,class:^(heroic)$,title:^(Exit)$
      windowrulev2 = center,class:^(gimp-2.99)$,floating:1
      windowrulev2 = center,class:^(file-*),title:^(Export Image as*),floating:1
      windowrulev2 = center,title:^(Really Quit*),floating:1

      # misc
      #windowrulev2 = stayfocused, title:^(Steam)$, class:^(steam)$

    '';
  };
}
