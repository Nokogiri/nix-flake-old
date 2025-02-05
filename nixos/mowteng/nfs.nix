{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.nfs-utils ];
  services.rpcbind.enable = true; # needed for NFS
  systemd.mounts =
    let
      commonMountOptions = {
        type = "nfs";
        mountConfig = {
          Options = "nfsvers=4,nolock";
        };
      };
    in
    [
      (
        commonMountOptions
        // {
          what = "10.200.200.1:/Vault3.1";
          where = "/media/nfs/Vault3.1";
        }
      )

      (
        commonMountOptions
        // {
          what = "10.200.200.1:/Vault1.1";
          where = "/media/nfs/Vault1.1";
        }
      )
    ];

  systemd.automounts =
    let
      commonAutoMountOptions = {
        wantedBy = [ "multi-user.target" ];
        automountConfig = {
          TimeoutIdleSec = "600";
        };
      };
    in
    [
      (commonAutoMountOptions // { where = "/media/nfs/Vault3.1"; })
      (commonAutoMountOptions // { where = "/media/nfs/Vault1.1"; })
    ];
}
