{ config, ... }:{
  #imports = [ ./paperless-key.nix ];
  sops.secrets.paperless_admin = {
    owner = config.services.paperless.user;
  };
  services.paperless = {
    enable = true;
    consumptionDirIsPublic = true;
    consumptionDir = "/media/Vault3.1/paperless";
    passwordFile = config.sops.secrets.paperless_admin.path;
    extraConfig = {
      PAPERLESS_DBENGINE = "postgresql";
      PAPERLESS_DBHOST = "/run/postgresql";
      PAPERLESS_CONSUMER_IGNORE_PATTERN =
        builtins.toJSON [ ".DS_STORE/*" "desktop.ini" ];
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      PAPERLESS_REDIS = "redis://127.0.0.1:6380";
      PAPERLESS_URL = "https://paper.fishoeder.net";
    };
  };
  services.redis.servers."paperless" = {
    enable = true;
    #port = 6380;
  };
  services.nginx = {
    virtualHosts = {
      "paper.fishoeder.net" = {
        extraConfig = "client_max_body_size 512M;";
        useACMEHost = "fishoeder.net";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://localhost:28981";
          extraConfig = "proxy_http_version 1.1;"
            + "proxy_set_header Upgrade $http_upgrade;"
            + ''proxy_set_header Connection "upgrade";'' + "proxy_redirect off;"
            + "proxy_set_header Host $host;"
            + "proxy_set_header X-Real-IP $remote_addr;"
            + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
            + "proxy_set_header X-Forwarded-Host $server_name;" + ''
              add_header Referrer-Policy "strict-origin-when-cross-origin";'';
        };
      };
    };
  };
}
