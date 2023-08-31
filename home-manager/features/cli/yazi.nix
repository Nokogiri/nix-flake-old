{ pkgs, ... }:{
  home.packages = with pkgs; [ ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide ];
  programs.yazi = {
    enable = true;
    settings = {
      sort_by = "natural";
      sort_dir_first = true;
      show_symlink = true;
    };
  };
}
