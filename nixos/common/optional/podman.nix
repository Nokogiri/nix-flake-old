{ pkgs, lib, ... }:
{
  virtualisation.oci-containers.backend = "podman";
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerSocket.enable = true;
  };
  virtualisation.containers.storage.settings = {
    storage = {
      driver = lib.mkDefault "btrfs";
      graphroot = "/var/lib/containers/storage";
      runroot = "/run/containers/storage";
    };
  };
}
