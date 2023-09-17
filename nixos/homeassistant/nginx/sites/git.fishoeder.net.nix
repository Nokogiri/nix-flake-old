{
  services.nginx = {
    virtualHosts."git.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/git";
    };
  };
}
