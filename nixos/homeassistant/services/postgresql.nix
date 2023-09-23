{
  services.postgresql = {
    enable = true;
    settings = { password_encryption = "scram-sha-256"; };
    #authentication = "	local    giteadb    gitea    scram-sha-256\n";
    ensureDatabases = [ "forgejodb" ];
    ensureUsers = [{
      name = "forgejo";
      ensurePermissions = { "DATABASE forgejodb" = "ALL PRIVILEGES"; };
    }];
  };
}
