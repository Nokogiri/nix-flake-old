{
  services.nginx = {
    virtualHosts."home.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/";
      default = true;
      locations = {
      	"/nginx_status" = {
      		extraConfig = ''
      			stub_status;
      			#allow 192.168.178.0/24;
      			allow 10.200.200.0/24;
      			allow 127.0.0.1;
      			deny all;
      		'';
      	};
      };
    };
  };
}
