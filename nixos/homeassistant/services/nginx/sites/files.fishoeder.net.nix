{
  services.nginx = {
    virtualHosts."files.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/files";
    };
  };
}
