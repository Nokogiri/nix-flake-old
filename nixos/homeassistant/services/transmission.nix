{
  config,
  pkgs,
  lib,
  ...
}:
{
  services = {
    transmission = {
      enable = true;
      user = "nokogiri";
      openPeerPorts = true;
      credentialsFile = "/var/lib/secrets/transmission/settings.json";
      settings = {
        incomplete-dir = "/media/Vault3.1/downloads/.incomplete";
        download-dir = "/media/Vault3.1/downloads";
        rpc-bind-address = "10.200.200.1";
      };
    };
  };
}
