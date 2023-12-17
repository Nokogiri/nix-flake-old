{ pkgs, ... }:
let user = "nokogiri";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --cmd '$SHELL -l'";
        user = "greeter";
      };
    };
  };
}
