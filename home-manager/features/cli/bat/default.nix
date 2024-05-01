{ pkgs, ... }:
{
  #xidg.configFile."bat/themes/Dracula.tmTheme".source =
  #  ./Dracula.tmTheme;
  programs.bat = {
    enable = true;
    #config.theme = "Dracula";
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };
}
