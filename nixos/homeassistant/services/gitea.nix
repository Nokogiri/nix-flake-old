{ pkgs, config, ... }: {
  sops.secrets.gitea = { sopsFile = ../../common/secrets.yaml; };
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    database = {
      type = "postgres";
      name = "giteadb";
    };
    settings = {
      server = {
        COOKIE_SECURE = true;
        DOMAIN = "git.fishoeder.net";
        PROTOCOL = "http+unix";
      };
      mailer = {
        ENABLED = true;
        MAILER_TYPE = "smtps";
        FROM = "gitea@fishoeder.net";
        SMTP_ADDR = "smtp.gmail.com";
        SMTP_PORT = "465";
        USER = "nokogiri@gefjon.org";
        PROTOCOL = "smtps";
      };
      other = {
        SHOW_FOOTER_VERSION = false;
      };
    };
  };
  services.nginx = {
    #upstreams = {
    #  servers = { "gitea" = "unix:${config.services.gitea.settings.server.HTTP_ADDR}"; };
    #};
    virtualHosts = {
      "git.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        locations."/" = {
          proxyPass = "http://unix:/${config.services.gitea.settings.server.HTTP_ADDR}";
          extraConfig = "proxy_set_header Host $host;"
            + "proxy_set_header X-Real-IP $remote_addr;"
            + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
            + "proxy_set_header X-Forwarded-Proto $scheme;";
        };
      };
    };
  };
}
