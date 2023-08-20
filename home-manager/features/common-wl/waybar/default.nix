{ pkgs, inputs, ... }:

{
  xdg.configFile."waybar/colors.css".source = ./colors.css;
  programs.waybar = {
    enable = true;
    package = pkgs.waybar-hyprland;
    style = ./style.css;
    settings = {
      mainBar = {

        layer = "top";
        position = "top";
        height = 42;

        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "battery" "network" "pulseaudio" ];

        "wlr/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
          };
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%d.%m.%Y %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
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
          format = "{cpacity}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          tooltip = true;
        };
        "network" = {
          format-wifi = "";
          format-ethernet = "";
          format-linked = "(No IP) ";
          format-disconnected = "";
          interval = 60;
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };
        "pulseaudio" = {
          scroll-step = 2.5;
          tooltip-format = "{volume}% {icon} {desc}";
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% ";
          format-bluetooth-muted = "󰝟 {icon} ";
          format-muted = "";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car =  "";
            default = "";
          };
          on-click = "${pkgs.lxqt.pavucontrol-qt}/bin/pavucontrol-qt";
          tooltip = true;
        };
      };
    };
  };

}
