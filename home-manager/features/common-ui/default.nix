{ pkgs, ... }: {
  imports = [
    ./firefox
    ./gpg-agent.nix
    ./kitty.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./rbw.nix
    ./styles.nix
    #./thunderbird.nix
    ./udisks.nix
    ./vscode.nix
    ./zathura.nix
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    NO_AT_BRIDGE = "1";
  };

  home.packages = with pkgs; [ xdg_utils ];
}
