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
      #package = pkgs.transmission_4;
      openPeerPorts = true;
      credentialsFile = "/var/lib/secrets/transmission/settings.json";
      settings = {
        incomplete-dir = "/media/Vault3.1/downloads/.incomplete";
        download-dir = "/media/Vault3.1/downloads";
        rpc-bind-address = "10.200.200.1";
        #speed-limit-up = 0;
        speed-limit-up-enabled = true;
      };
    };
  };
}
