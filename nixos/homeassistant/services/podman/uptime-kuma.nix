{
  virtualisation.oci-containers.containers = {
    uptime-kuma = {
      image = "louislam/uptime-kuma:1";
      autoStart = true;
      volumes = [
        "/var/lib/pods/uptime-kuma:/app/data"
        "/var/run/podman/podman.sock:/var/run/docker.sock"
      ];
      environment = {
        UPTIME_KUMA_HOST = "10.200.200.1";
        UPTIME_KUMA_PORT = "4000";
      };
      #ports = [
      #	"10.200.200.1:4001:3001/tcp"	
      #];
      extraOptions = [ "--network=host" ];
    };
  };
}
