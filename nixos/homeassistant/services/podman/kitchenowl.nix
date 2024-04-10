{
  virtualisation.oci-containers.containers = {
    kowl-front = {
      image = "tombursch/kitchenowl-web:latest";
      autoStart = true;
      #restart = "unless-stopped";
      volumes = [
        "/var/lib/pods/calibre-web/calibre-data:/config"
        "/var/lib/pods/calibre-web/books:/books"
      ];
      environment = {
        TZ = "Europe/Berlin";
        DOCKER_MODS = "linuxserver/mods:universal-calibre";
        PUID = "1000";
        PGID = "1000";
      };
      ports = [ "10.200.200.1:8099:80/tcp" ];
      dependsOn = [ "back" ];
    };
    back = {
      image = "tombursch/kitchenowl:latest";
      autoStart = true;
      #restart = "unless-stopped";
      environment = {
        JWT_SECRET_KEY = "PLEASE_CHANGE_ME";
      };
      volumes = [ "/var/lib/pods/kitchenowl:/data" ];
    };
  };
}
