{ pkgs, ... }: {
  services.gitea = {
    enable = true;
    package = pkgs.forgejo;
    database = {
      type = "postgres";
      name = "giteadb";
    };

  };
}
