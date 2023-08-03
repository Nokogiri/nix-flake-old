{ config, lib, pkgs, ...}:{


    systemd.services.wifi-before-sleep = {
      description = "Unload WiFi Module so it doesnt freak out on resume";
      before = [ "suspend.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = [ "${pkgs.kmod}/bin/rmmod brcmfmac_wcc" "${pkgs.kmod}/bin/rmmod brcmfmac" ];        #ExecStart = "${pkgs.kmod}/bin/rmmod brcmfmac";
        TimeoutSec = 0;
      };
      wantedBy = [ "suspend.target" ];
    };

    systemd.services.wifi-after-sleep = {
      description = "Load WiFi after resume";
      after = [ "suspend.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.kmod}/bin/modprobe brcmfmac";
        TimeoutSec = 0;
      };
      wantedBy = [ "suspend.target" ];
    };
    
    systemd.services.disable-nvme-d3cold = {
    description = "Disables d3cold on the NVME controller";
    before      = [ "suspend.target" ];
    path        = [ pkgs.bash pkgs.coreutils ];

    serviceConfig.Type = "oneshot";
    serviceConfig.ExecStart = "${./disable-nvme-d3cold.sh}";
    serviceConfig.TimeoutSec = 0;

    wantedBy = [ "multi-user.target" "suspend.target" ];
  };

}
