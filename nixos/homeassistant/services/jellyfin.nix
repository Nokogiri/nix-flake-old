{ pkgs, ... }: {
  #environment.systemPackages = with pkgs; [ jellyfin-ffmpeg ];
  services.jellyfin.enable = true;
  services.jellyfin.package = inputs.nixpkgs-master.legacyPackages.x86_64-linux.jellyfin;
  services.nginx = {
    virtualHosts."media.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://10.200.200.1:8096";
        extraConfig = "proxy_redirect off;" + "proxy_set_header Range $http_range;"
          + "proxy_set_header If-Range $http_if_range;" + "proxy_set_header X-Real-IP $remote_addr;"
          + "proxy_set_header Host $host;" + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header X-Forwarded-Protocol $scheme;" + "proxy_http_version 1.1;"
          + "proxy_set_header Upgrade $http_upgrade;" + ''proxy_set_header Connection "upgrade";'';
      };
    };
  };
}
