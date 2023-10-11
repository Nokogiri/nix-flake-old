{ pkgs, ... }: {
  virtualisation.oci-containers.backend = "podman";
  virtualisation.podman = {
    enable = true;
    #extraPackages = [ pkgs.zfs ];
    autoPrune.enable = false;
    dockerSocket.enable = true;
  };
  virtualisation.containers.storage.settings = {
    storage = {
      driver = "btrfs";
      graphroot = "/var/lib/containers/storage";
      runroot = "/run/containers/storage";
    };
  };
}
