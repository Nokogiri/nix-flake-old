{ pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      General = { InputMethod = "qtvirtualkeyboard"; };
      Wayland = {
        #CompositorCommand = "${pkgs.cage}/bin/cage -s ";
        SessionDir = "/run/current-system/sw/share/wayland-sessions";
      };
      Theme = {
        ThemeDir = "/run/current-system/sw/share/sddm/themes/";
        Current = "where_is_my_sddm_theme";
      };
    };
  };
  environment.systemPackages = [
    #pkgs.hyprland
    pkgs.swayfx
    (pkgs.where-is-my-sddm-theme.override {
      themeConfig.General = {
        background =
          "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        backgroundMode = "none";
      };
    })
  ];
  environment.pathsToLink = [ "/share/sddm/themes" ];
}
