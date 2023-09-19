{ pkgs, config, ... }: {
  sops.secrets.forgejo_mail = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.services.forgejo.user;
    group = config.services.forgejo.group;
  };
  sops.secrets.forgejo_pg = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.services.forgejo.user;
    group = config.services.forgejo.group;
  };

  services.forgejo = {
    enable = true;
    package = pkgs.forgejo;
    database = {
      type = "postgres";
      name = "forgejodb";
      passwordFile = config.sops.secrets.forgejo_pg.path;
    };
    mailerPasswordFile = config.sops.secrets.forgejo_mail.path;
    settings = {
      session = { COOKIE_SECURE = true; };
      server = { DISABLE_REGISTRATION = true; };
      server = {
        DOMAIN = "git.fishoeder.net";
        PROTOCOL = "http+unix";
        ROOT_URL = "https://git.fishoeder.net";
        STATIC_URL_PREFIX = "/_/static";
      };
      repository = {
        ENABLE_PUSH_CREATE_USER = true;
        DEFAULT_PUSH_CREATE_PRIVATE = false;
      };
      mailer = {
        ENABLED = true;
        FROM = "forgejo@fishoeder.net";
        SMTP_ADDR = "smtp.gmail.com";
        SMTP_PORT = "465";
        USER = "nokogiri@gefjon.org";
        PROTOCOL = "smtps";
      };
      other = { SHOW_FOOTER_VERSION = false; };
    };
  };
  services.nginx = {
    #upstreams = {
    #  servers = { "forgejo" = "unix:${config.services.forgejo.settings.server.HTTP_ADDR}"; };
    #};
    virtualHosts = {
      "git.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        locations."/_/static/assets/" = {
          alias = "${config.services.forgejo.package.data}";
        };
        locations."/" = {
          proxyPass =
            "http://unix:/${config.services.forgejo.settings.server.HTTP_ADDR}";
          extraConfig = "proxy_set_header Host $host;"
            + "proxy_set_header X-Real-IP $remote_addr;"
            + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
            + "proxy_set_header X-Forwarded-Proto $scheme;";
        };
      };
    };
  };
}
