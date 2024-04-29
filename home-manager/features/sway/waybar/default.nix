{ pkgs, inputs, ... }:
{
  xdg.configFile."waybar/colors.css".source = ./colors.css;
  home.packages = [ pkgs.wttrbar ];
  programs.waybar = {
    enable = true;
    #package = inputs.nixpkgs-master.legacyPackages.x86_64-linux.waybar;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 42;

        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "battery"
          "network"
          "pulseaudio"
        ];

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 16;
          #icon-theme = "Dracula";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "Alacritty" ];
          app_ids-mapping = {
            "firefoxdeveloperedition" = "firefox-developer-edition";
          };
          #rewrite = {
          #  "Firefox Web Browser" = "Firefox";
          #  "Foot Server" = "Terminal";
          #};
        };
        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            focused = "";
            default = "";
            persistant = "◌";
            empty = "◌";
          };
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%d.%m.%Y %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          min-length = 5;
        };
        "battery" = {
          bat = "BAT0";
          states = {
            good = 81;
            warning = 35;
            critical = 20;
          };
          format-charging = "{capacity}% {icon} 󱐌";
          format-full = "{capacity}% {icon}";
          format-discharging = "{capacity}% {icon}";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip = true;
        };
        "network" = {
          format-wifi = "󰤨 ";
          format-ethernet = "";
          format-linked = "(No IP) ";
          format-disconnected = "";
          interval = 60;
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        "pulseaudio" = {
          scroll-step = 2.5;
          tooltip-format = "{volume}% {icon} {desc}";
          ignored-sinks = [ "Q35 EQ Ambience" ];
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}%  ";
          format-bluetooth-muted = "  ";
          format-muted = " ";
          format-source = "{volume}%  ";
          format-source-muted = " ";
          format-icons = {
            headphone = "  ";
            hands-free = "  ";
            headset = "  ";
            phone = "  ";
            portable = "  ";
            car = "  ";
            default = " 󰕾 ";
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
          tooltip = true;
        };
        "tray" = {
          show-passive-items = true;
          spacing = 10;
        };
        "custom/weather" = {
          format = "{}°C";
          tooltip = true;
          interval = 60;
          exec = "${pkgs.wttrbar}/bin/wttrbar --hide-conditions";
          return-type = "json";
        };
      };
    };
  };
}
