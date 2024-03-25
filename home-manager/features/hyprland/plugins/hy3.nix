{ pkgs, inputs, ... }:{
  wayland.windowManager.hyprland = {
    #plugins = [ (inputs.hy3.packages.x86_64-linux.hy3.overrideAttrs { patches = [ ./tmp.patch ];}) ];
    plugins = [ inputs.hy3.packages.x86_64-linux.hy3 ];
    #plugins = [ () ];
    extraConfig = ''
      plugin {
        hy3 {
          no_gaps_when_only = true;
        }
      }
    '';
  };
}
