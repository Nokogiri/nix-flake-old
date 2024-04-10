{ pkgs, ... }:
{
  programs.micro = {
    enable = true;
    settings = {
      autoclose = true;
      colorscheme = "dracula";
    };
  };
  home.sessionVariables = {
    MICRO_TRUECOLOR = "1";
  };
  xdg.configFile."micro/colorschemes/dracula.micro".source = ./dracula.micro;
}
