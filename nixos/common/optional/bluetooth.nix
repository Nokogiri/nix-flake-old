{ pkgs, ... }:
{
  hardware = {
    bluetooth.enable = true;
    bluetooth.package = pkgs.bluez5-experimental;
    bluetooth.settings = {
      General = {
        ControllerMode = "dual";
        #FastConnectable = true;
        Experimental = true;
      };
      #LE = {
      #  MinConnectionInterval=1;
      #  MaxConnectionInterval=6;
      #  ConnectionLatency=0;
      #};
      Policy = {
        AutoEnable = true;
      };
    };
  };
  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd --experimental"
  ];
}
