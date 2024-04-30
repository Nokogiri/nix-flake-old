{
  xdg.configFile."wezterm/colors/dracula.toml".source = ./dracula.toml;
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = "Dracula",
        font_size = 12.5 ,
        font = wezterm.font_with_fallback {
          'M+CodeLat60 Nerd Font',
        },
        warn_about_missing_glyphs=false,
        animation_fps = 1,
        enable_kitty_graphics=true,
        enable_wayland = true,
        default_cursor_style = "BlinkingUnderline",
        window_background_opacity = 0.8,
        hide_tab_bar_if_only_one_tab = true,
        tab_bar_at_bottom = true,
        use_fancy_tab_bar = true,
        show_tab_index_in_tab_bar = false,
       }
    '';
  };
}
