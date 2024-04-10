{ pkgs, ... }:
{

  home.packages = with pkgs; [ rofimoji ];
  programs.rofi = {
    #package = pkgs.rofi-wayland.override { plugins = [ pkgs.rofi-emoji ]; };
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-emoji ];
    enable = true;
    extraConfig = {
      display-drun = "";
      modi = "drun,ssh,window";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      show-icons = true;
    };
    theme = ./dracula.rasi;
  };

  #xdg.configFile."rofimoji.rc".text = ''
  #  files all
  #'';
}
