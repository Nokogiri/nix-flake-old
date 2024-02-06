{ pkgs, config, ... }:
let user = "nokogiri";
in {
  environment.systemPackages = [ pkgs.hyprland ];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --time --cmd '$SHELL -l'";
        #command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };
  programs.regreet = {
    enable = true;
    settings = { background = { path = "${pkgs.Imaginarium}/wallpaper/FireWatch.png"; }; };
  };
}
