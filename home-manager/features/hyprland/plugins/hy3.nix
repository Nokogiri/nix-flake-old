{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hy3.packages.x86_64-linux.hy3 ];
    extraConfig = ''
      plugin {
        hy3 {
          no_gaps_when_only = true;
        }
      }
    '';
  };
}
