{
  services.fail2ban = {
    enable = true;
    bantime = "3600";
    ignoreIP = [
      "10.200.200.0/16"
      "192.168.178.0/24"
    ];
    jails = {
      sshd = {
        settings = {
          filter = "sshd";
          port = "ssh";
          backend = "systemd";
          bantime = 7200;
          findtime = 3600;
          maxretry = 3;
        };
      };
      nginx = {
        settings = {
          port = "http,https";
          filter = "nginx-botsearch";
          #action = ''iptables-multiport[name=HTTP, port="http,https"]'';
          logpath = "/var/log/nginx/access.log*";
          logencoding = "utf-8";
          #backend = "auto";
          bantime = 3600;
          findtime = 120;
          maxretry = 3;
        };
      };
    };
  };
}
