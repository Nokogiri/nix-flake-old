{
  services.postgresql = {
    enable = true;
    settings = {
      password_encryption = "scram-sha-256";
    };
    #authentication = "	local    giteadb    gitea    scram-sha-256\n";
    ensureDatabases = [
      "forgejodb"
      "forgejo"
      "paperless"
    ];
    ensureUsers = [
      {
        name = "forgejo";
        #ensurePermissions = { "DATABASE forgejodb" = "ALL PRIVILEGES"; };
        ensureDBOwnership = true;
      }
      #{
      #  name = "paperless";
      #  ensurePermissions = { "DATABASE paperless" = "ALL PRIVILEGES"; };
      #}
    ];
  };
}
