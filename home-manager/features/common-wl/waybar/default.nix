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
        modules-right = [ "tray" "battery" "pulseaudio" ];

        "wlr/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
          };
        };
        "battery" = {
          bat = "BAT0";
          states = {
            good = 81;
            warning = 35;
            critical = 20;
          };
          format-charging = "{icon} 󱐌";
          format-full = "{icon}";
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          tooltip = true;
        };
      };
    };
  };

}
