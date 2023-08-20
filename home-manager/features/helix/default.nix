{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.indent-guides = { render = true; };
    };
  };
}
