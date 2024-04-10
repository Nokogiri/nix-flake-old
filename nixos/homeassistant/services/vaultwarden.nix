{ config, pkgs, ... }:
{
  sops.secrets.vaultwarden = {
    sopsFile = ../../common/secrets.yaml;
  };
  services.vaultwarden = {
    enable = true;
    backupDir = "/media/Vault3.1/backup/vaultwarden";
    config = {
      DOMAIN = "https://vault.fishoeder.net";
      WEB_VAULT_FOLDER = "${pkgs.bitwarden_rs-vault}/share/vaultwarden/vault";
      WEB_VAULT_ENABLED = true;
      #LOG_FILE = "/var/log/vaultwarden";
      WEBSOCKET_ENABLED = false;
      WEBSOCKET_ADDRESS = "0.0.0.0";
      WEBSOCKET_PORT = 3012;
      ROCKET_PORT = 8812;
      SMTP_HOST = "smtp.gmail.com";
      SMTP_FROM = "vault@fishoeder.net";
      SMTP_FROM_NAME = "Vaultwarden";
      SMTP_PORT = 587;
      SMTP_SSL = true;
      SMTP_TIMEOUT = 15;
    };
    environmentFile = config.sops.secrets.vaultwarden.path;
  };
  services.nginx = {
    virtualHosts = {
      "vault.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        locations."/" = {
          proxyPass = "http://127.0.0.1:8812"; # changed the default rocket port due to some conflict
          proxyWebsockets = true;
        };
        locations."/notifications/hub" = {
          proxyPass = "http://127.0.0.1:3012";
          proxyWebsockets = true;
        };
        locations."/notifications/hub/negotiate" = {
          proxyPass = "http://127.0.0.1:8812";
          proxyWebsockets = true;
        };
      };
    };
  };
}
