{ pkgs, ... }: {
  home.packages = [
    pkgs.fuzzel
    pkgs.pass-fuzzel
    (pkgs.writeTextFile {
      name = "hyprfuzzel";
      destination = "/bin/hyprfuzzel";
      executable = true;
      text = ''
        ${pkgs.fuzzel}/bin/fuzzel --log-level=error -l 10 --layer=overlay   
      '';
    })
  ];
  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    # output=<not set>
    # font=monospace
    font=Hack Nerd Font Propo:size=10
    dpi-aware=yes
    prompt=➟ 
    icon-theme=Dracula
    icons-enabled=yes
    fields=filename,name,generic
    #password-character=*
    fuzzy=yes
    # show-actions=no
    # terminal=$TERMINAL -e  # Note: you cannot actually use environment variables here
    terminal=kitty
    # launch-prefix=<not set>

    width=45
    horizontal-pad=10
    vertical-pad=10
    inner-pad=10
    line-height=18


    [colors]
    background=282a36dd
    text=f8f8f2ff
    match=8be9fdff
    selection-match=8be9fdff
    selection=44475add
    selection-text=f8f8f2ff
    border=bd93f9ff

    [border]
    width=1
    radius=8

    [dmenu]
    mode=text  # text|index
    # exit-immediately-if-empty=no
  '';
}
