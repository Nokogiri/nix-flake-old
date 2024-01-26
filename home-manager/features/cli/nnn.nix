{ pkgs, config, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };
    plugins = {
      src = (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "5602d46660c45f24254790b21eca8aff52f56e83"; # 15.12.2023
        sha256 = "sha256-AEsohKPyzAupN+ga75LTSpMWdA1cppvXJ7BtZ8Z3cAc=";
      }) + "/plugins";
      mappings = { p = "preview-tui"; };
    };
  };
  home.sessionVariables = {
    NNN_BATTHEME = "Dracula";
    NNN_BATSTYLE = "full";
    NNN_PREVIEWDIR = "${config.home.sessionVariables.XDG_CACHE_HOME}/nnn/previews";
    NNN_ICONLOOKUP = 1;
    BAT_THEME = "Dracula";
  };
}
