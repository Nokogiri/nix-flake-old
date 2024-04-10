{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment = {
    systemPackages = [ pkgs.dave ];
    etc."dave/config.yaml" = {
      text = ''
        address: "127.0.0.1"
        port: "8765"
        dir: "/srv/webdav"
        #prefix: "/dav"
        users:
          nokogiri:
            password: "$2a$12$RJvmqt/UxojdL/R6gsrWNugwFwJHS6e11KKzXq6TbHg4oWUq1DnXC"
            subdir: "/nokogiri"
          admin:
            password: "$2a$12$RJvmqt/UxojdL/R6gsrWNugwFwJHS6e11KKzXq6TbHg4oWUq1DnXC"
      '';
    };
  };

  systemd.services."dave" = {
    enable = true;
    description = "dave";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      User = "nokogiri";
      ExecStart = "${pkgs.dave}/bin/dave --config /etc/dave/config.yaml";
      Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
    };
  };
  services.nginx = {
    virtualHosts."dav.fishoeder.net" = {
      forceSSL = true;
      useACMEHost = "fishoeder.net";
      locations."/" = {
        proxyPass = "http://127.0.0.1:8765";
        extraConfig =
          "proxy_buffering off;"
          + "proxy_read_timeout    120s;"
          + "proxy_connect_timeout 90s;"
          + "proxy_send_timeout    90s;"
          + "proxy_redirect        off;"
          + "proxy_set_header      Host $host;"
          + "proxy_set_header      X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header      X-Forwarded-Proto $scheme;";
      };
    };
  };
}
