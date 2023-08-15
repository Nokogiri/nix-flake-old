{
  wayland.windowManager.hyprland.settings = {
    monitor = [ "eDP-1,preferred,auto,1.25" ",preferred,auto,1" ];
    input = { touchdevice = { output = "eDP-1"; }; };
    "device:wacom-hid-49c8-pen" = {
      output = "eDP-1";
      enabled = true;
    };
  };
}
