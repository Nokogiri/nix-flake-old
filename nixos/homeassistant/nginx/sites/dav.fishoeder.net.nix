{
  services.nginx = {
    virtualHosts = {
      "vault.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        locations."/" = {
          proxyPass =
            "http://localhost:8812"; # changed the default rocket port due to some conflict
          proxyWebsockets = true;
        };
        locations."/notifications/hub" = {
          proxyPass = "http://localhost:3012";
          proxyWebsockets = true;
        };
        locations."/notifications/hub/negotiate" = {
          proxyPass = "http://localhost:8812";
          proxyWebsockets = true;
        };
      };
    };
  };
}