{ pkgs, config, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    plugins = {
      src = (pkgs.fetchFromGitHub {
        owner = "Nokogiri";
        repo = "nnn";
        rev = "c992716cbb2f8d1df3ebdc6444a66fe20d3e625f"; # 01.09.2023
        sha256 = "sha256-8YXWSniPu7RJTcf5nzXpgQTWXldWFujgHYmQTdvfb3M=";
      }) + "/plugins";
      mappings = { p = "preview-tui"; };
    };
  };
  home.sessionVariables = {
    NNN_BATTHEME = "Dracula";
    NNN_BATSTYLE = "full";
    NNN_PREVIEWDIR =
      "${config.home.sessionVariables.XDG_CACHE_HOME}/nnn/previews";
    NNN_ICONLOOKUP = 1;
    BAT_THEME = "Catppuccin-frappe";
  };
}
