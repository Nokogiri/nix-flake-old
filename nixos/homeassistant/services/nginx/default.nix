{ config, ... }:
{
  imports = [
    ./sites/cache.fishoeder.net.nix
    ./sites/files.fishoeder.net.nix
    ./sites/food.fishoeder.net.nix
    ./sites/home.fishoeder.net.nix
    #./sites/git.fishoeder.net.nix
  ];

  sops.secrets.ovh_dns = {
    sopsFile = ../../../common/secrets.yaml;
    owner = "acme";
  };

  security.acme = {
    acceptTerms = true;
    defaults = {
      credentialsFile = "/run/secrets/ovh_dns";
      dnsProvider = "ovh";
      email = "nokogiri@gefjon.org";
      group = "nginx";
      renewInterval = "daily";
    };

    certs = {
      "fishoeder.net" = {
        domain = "fishoeder.net";
        extraDomainNames = [ "*.fishoeder.net" ];
      };
      "gefjon.org" = {
        domain = "gefjon.org";
        extraDomainNames = [ "*.gefjon.org" ];
      };
    };
  };
  services.phpfpm.pools.general = {
    user = "nokogiri";
    group = "users";
    settings = {
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 32;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 2;
      "pm.max_spare_servers" = 4;
      "pm.max_requests" = 500;
    };
  };

  services.nginx = {
    enable = true;
    user = "nokogiri";
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    appendHttpConfig = ''
      access_log syslog:server=unix:/dev/log;
    '';
  };
}
