{
  services.tlp = {
    enable = true;
    settings = {
      MAX_LOST_WORK_SECS_ON_AC = "15";
      MAX_LOST_WORK_SECS_ON_BAT = "60";
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      #CPU_SCALING_MIN_FREQ_ON_AC = "400000";
      #CPU_SCALING_MAX_FREQ_ON_AC = "3500000";
      #CPU_SCALING_MIN_FREQ_ON_BAT = "400000";
      #CPU_SCALING_MAX_FREQ_ON_BAT = "1000000";
      #CPU_BOOST_ON_AC = "1";
      #CPU_BOOST_ON_BAT = "0";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      NMI_WATCHDOG = "0";
      #SATA_LINKPWR_ON_AC = "med_power_with_dipm max_performance";
      #SATA_LINKPWR_ON_BAT = "med_power_with_dipm min_power";
      AHCI_RUNTIME_PM_ON_AC = "on";
      AHCI_RUNTIME_PM_ON_BAT = "auto";
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";
      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";
      WOL_DISABLE = "Y";
      SOUND_POWER_SAVE_ON_AC = "1";
      SOUND_POWER_SAVE_ON_BAT = "1";
      SOUND_POWER_SAVE_CONTROLLER = "Y";
      USB_AUTOSUSPEND = "1";
      USB_DENYLIST = "152d:0578";
      DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi";
      DEVICES_TO_ENABLE_ON_AC = "bluetooth wifi";
      DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "";
    };
  };
}
