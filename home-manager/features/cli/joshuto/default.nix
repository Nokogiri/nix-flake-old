{ pkgs, lib, ... }: {
  programs.joshuto = {
    enable = true;
    settings = {
      preview = {
        preview_script = "~/.config/joshuto/preview_file.sh";
        preview_shown_hook_script = "~/.config/joshuto/on_preview_shown";
        review_removed_hook_script = "~/.config/joshuto/on_preview_removed";
      };
    };
  };

  xdg.configFile = {
    "joshuto/preview_file.sh" = {
      source = ./preview.sh;
      executable = true;
    };
    "joshuto/on_preview_shown" = {
      source = ./on_preview_shown2;
      executable = true;
    };
    "joshuto/on_preview_removed" = {
      source = ./on_preview_removed;
      executable = true;
    };
  };
}
