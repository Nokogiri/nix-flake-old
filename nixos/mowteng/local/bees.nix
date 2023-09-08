{
  services.beesd.filesystems = {
    root = {
      spec = "LABEL=mowteng";
      hashTableSizeMB = 1024;
      extraOptions = [ "--loadavg-target" "5.0" ];
    };
  };
}
