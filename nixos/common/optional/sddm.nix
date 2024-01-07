{ pkgs, ... }:{
  environment.systemPackages = [ pkgs.hyprland ];
  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      Wayland = {
        #CompositorCommand = "${pkgs.cage}/bin/cage -s ";
        SessionDir = "/run/current-system/sw/share/wayland-sessions";
      };
    };
  };
}
