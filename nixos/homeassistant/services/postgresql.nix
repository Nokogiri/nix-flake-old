{
  services.postgresql = {
    enable = true;
    settings = { password_encryption = "scram-sha-256"; };
    #authentication = "	local    giteadb    gitea    scram-sha-256\n";
    ensureDatabases = [ "giteadb" ];
    ensureUsers = [{
      name = "gitea";
      ensurePermissions = { "DATABASE giteadb" = "ALL PRIVILEGES"; };
    }];

  };
}
