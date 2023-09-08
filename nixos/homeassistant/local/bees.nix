{
  services.beesd.filesystems = {
    root = {
      spec = "LABEL=Vault3.1";
      hashTableSizeMB = 1024;
      extraOptions = [ "--loadavg-target" "5.0" ];
    };
  };
}
