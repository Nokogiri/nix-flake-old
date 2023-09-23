{
  services.samba-wsdd.enable =
    true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];

  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = ''
      workgroup = WORKGROUP
      multicast dns register = yes
      server string = smbnix
      netbios name = smbnix
      security = user
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.178. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nokogiri
      map to guest = bad user
    '';
    shares = {
      public = {
        path = "/media/Vault3.1/public";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
      personal = {
        path = "/media/Vault3.1/personal";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
      media = {
        path = "/media/Vault3.1/media";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
      backup = {
        path = "/media/Vault3.1/backup";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
      games = {
        path = "/media/Vault1.1/games";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
    };
  };
}
