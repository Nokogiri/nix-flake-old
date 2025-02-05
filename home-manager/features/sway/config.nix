{
  config,
  pkgs,
  ...
}:
let
  cfg = config.wayland.windowManager.sway.config;
in
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    package = pkgs.swayfx;
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=sway
      export XDG_CURRENT_DESKTOP=sway
    '';
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
    config = {
      assigns = {
        "1" = [
          { app_id = "kitty"; }
          { app_id = "org.wezfurlong.wezterm"; }
          { app_id = "foot"; }
        ];
        "2" = [
          { app_id = "firefox"; }
          { app_id = "chromium-browser"; }
          { class = "Chromium-browser"; }
        ];
        "3" = [ { app_id = "mpv"; } ];
        "4" = [
          { class = "Emacs"; }
          { app_id = "emacs"; }
        ];
        "5" = [
          { app_id = "org.pwmt.zathura"; }
          { app_id = "com.github.maoschanz.drawing"; }
        ];
        "6" = [
          { class = "steam"; }
          { app_id = "heroic"; }
        ];
        "7" = [
          { class = "Spotify"; }
          { app_id = "spotify-qt"; }
          { app_id = "dev.alextren.Spot"; }
        ];
        "8" = [
          { app_id = "transmission-qt"; }
          { app_id = "com.usebottles.bottles"; }
        ];
        "9" = [ { class = "Com.github.johnfactotum.Foliate"; } ];
      };
      bars = [ ];
      floating = {
        border = 0;
        criteria = [
          { app_id = "pavucontrol"; }
          { app_id = "retroarch"; }
          { app_id = ".blueman-manager-wrapped"; }
          { app_id = "nm-connection-editor"; }
          { app_id = "org.kde.polkit-kde-authentication-agent-1"; }
          { app_id = "org.kde.kdeconnect-indicator"; }
          { title = "File Operation Progress"; }
        ];
        modifier = "Mod4";
      };
      focus = {
        followMouse = true;
      };
      gaps = {
        inner = 3;
        outer = 6;
        smartBorders = "off";
        smartGaps = false;
      };
      input = {
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_layout = "us,de";
          xkb_options = "grp:alt_space_toggle";
          xkb_variant = "altgr-intl,";
        };
        "type:touchpad" = {
          events = "enabled";
          tap = "enabled";
          dwt = "disable";
        };
        "1386:18888:Wacom_HID_49C8_Finger" = {
          map_to_output = "eDP-1";
        };
        "1386:18888:Wacom_HID_49C8_Pen" = {
          map_to_output = "eDP-1";
        };
      };

      keybindings = {
        # Basics apps
        "${cfg.modifier}+Return" = "exec ${cfg.terminal}";
        "${cfg.modifier}+p" = "exec pkill -9 rofi || rofi -show drun";
        "${cfg.modifier}+i" = "exec pkill -9 rofi || cliphist list | rofi -dmenu | cliphist decode | wl-copy";

        # basic internals
        "${cfg.modifier}+Shift+q" = "kill";
        "${cfg.modifier}+Shift+c" = "reload";

        # navigate windows
        "${cfg.modifier}+Left" = "focus left";
        "${cfg.modifier}+Down" = "focus down";
        "${cfg.modifier}+Right" = "focus right";
        "${cfg.modifier}+Up" = "focus up";

        # move windows
        "${cfg.modifier}+Shift+Left" = "move left";
        "${cfg.modifier}+Shift+Down" = "move down";
        "${cfg.modifier}+Shift+Right" = "move right";
        "${cfg.modifier}+Shift+Up" = "move up";

        # splitting
        "${cfg.modifier}+h" = "split h";
        "${cfg.modifier}+v" = "split v";

        # fullscreen
        "${cfg.modifier}+f" = "fullscreen toggle";

        # container layouts
        "${cfg.modifier}+s" = "layout stacking";
        "${cfg.modifier}+g" = "layout tabbed";
        "${cfg.modifier}+e" = "layout toggle split";

        # floating
        "${cfg.modifier}+Shift+f" = "floating toggle";
        "${cfg.modifier}+Shift+space" = "fcous mode-toggle";

        # focus parent
        "${cfg.modifier}+a" = "focus parent";

        # focus child
        "${cfg.modifier}+d" = "focus child";

        # switch to ws
        "${cfg.modifier}+Tab" = "workspace back_and_forth";
        "${cfg.modifier}+1" = "workspace number 1";
        "${cfg.modifier}+2" = "workspace number 2";
        "${cfg.modifier}+3" = "workspace number 3";
        "${cfg.modifier}+4" = "workspace number 4";
        "${cfg.modifier}+5" = "workspace number 5";
        "${cfg.modifier}+6" = "workspace number 6";
        "${cfg.modifier}+7" = "workspace number 7";
        "${cfg.modifier}+8" = "workspace number 8";
        "${cfg.modifier}+9" = "workspace number 9";

        # move containers
        "${cfg.modifier}+Shift+1" = "move container to workspace number 1";
        "${cfg.modifier}+Shift+2" = "move container to workspace number 2";
        "${cfg.modifier}+Shift+3" = "move container to workspace number 3";
        "${cfg.modifier}+Shift+4" = "move container to workspace number 4";
        "${cfg.modifier}+Shift+5" = "move container to workspace number 5";
        "${cfg.modifier}+Shift+6" = "move container to workspace number 6";
        "${cfg.modifier}+Shift+7" = "move container to workspace number 7";
        "${cfg.modifier}+Shift+8" = "move container to workspace number 8";
        "${cfg.modifier}+Shift+9" = "move container to workspace number 9";
        # scratchpad
        "${cfg.modifier}+Shift+minus" = "move scratchpad";
        "${cfg.modifier}+minus" = "scratchpad show";

        # sway-prop
        "${cfg.modifier}+Shift+i" = "exec /home/nokogiri/.local/bin/sway-prop";

        "${cfg.modifier}+w" = "exec makoctl dismiss";
        # Apps
        ###
        # brightness
        "XF86MonBrightnessDown" = "exec ${pkgs.swayosd}/bin/swayosd-client --brightness lower";
        "XF86MonBrightnessUp" = "exec ${pkgs.swayosd}/bin/swayosd-client --brightness raise";

        "XF86AudioRaiseVolume" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume raise";
        "XF86AudioLowerVolume" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume lower";
        "XF86AudioMute" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle";

        # powermenu 
        #"XF86PowerOff" = "exec pkill -9 wlogout || ${pkgs.wlogout}/bin/wlogout -p layer-shell";
        # grimshot
        "${cfg.modifier}+m" = "exec grimshot save output";
        "${cfg.modifier}+Shift+m" = "exec grimshot save active";
        "${cfg.modifier}+Mod1+m" = "exec grimshot save area";
        "${cfg.modifier}+Ctrl+m" = "exec grimshot save window";

        # mylock
        "${cfg.modifier}+l" = "exec ${config.home.homeDirectory}/.local/bin/mylock";
        "${cfg.modifier}+Shift+l" = "exec ${config.home.homeDirectory}/.local/bin/mylock at-home-mode";
        "${cfg.modifier}+Ctrl+l" = "exec ${config.home.homeDirectory}/.local/bin/mylock safe-mode";
        "${cfg.modifier}+Shift+Ctrl+l" = "exec ${config.home.homeDirectory}/.local/bin/mylock lock-now";
      };
      menu = "\${pkgs.fuzzel}/bin/fuzzel";
      modifier = "Mod4";
      seat = {
        "*" = {
          hide_cursor = "when-typing 10";
        };
      };
      startup = [
        {
          command = "configure-gtk";
          always = true;
        }
        { command = "wl-paste --watch cliphist store"; }
        { command = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"; }
      ];
      terminal = "${pkgs.kitty}/bin/kitty";
      window = {
        border = 0;
        commands = [
          {
            command = "layout tabbed";
            criteria = {
              app_id = "foot";
            };
          }
          {
            command = "resize set 1200 900";
            criteria = {
              app_id = "pavucontrol-qt";
            };
          }
          {
            command = "inhibit_idle fullscreen";
            criteria = {
              app_id = "firefox";
            };
          }
        ];
      };
      workspaceAutoBackAndForth = true;
    };
    extraConfig = ''
        bindgesture swipe:3:right workspace prev
        bindgesture swipe:3:left workspace next
        
        corner_radius 8
        blur enable
        blur_passes 2
        blur_radius 8
        blur_noise 0.0
        blur_brightness 0.9
        blur_contrast 1.0
        blur_saturation 1.0
        titlebar_separator disable
        shadows disable
        #shadow_offset 4 4
        #shadow_blur_radius 4
        default_dim_inactive 0.2
        shadows_on_csd disable
        layer_effects "rofi" blur enable; corner_radius 8;

      #  for_window [app_id="org.qutebrowser.qutebrowser"] inhibit_idle fullscreen

    '';
    systemd.enable = true;
  };
}
