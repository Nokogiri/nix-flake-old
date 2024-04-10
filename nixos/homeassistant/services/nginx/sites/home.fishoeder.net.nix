{
  services.nginx = {
    virtualHosts."home.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/";
      default = true;
      locations = {
        "/nginx_status" = {
          extraConfig = "	stub_status;\n	#allow 192.168.178.0/24;\n	allow 10.200.200.0/24;\n	allow 127.0.0.1;\n	deny all;\n";
        };
      };
    };
  };
}
