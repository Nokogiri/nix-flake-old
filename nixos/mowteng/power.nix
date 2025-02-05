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
      CPU_SCALING_MIN_FREQ_ON_AC = "200000";
      CPU_SCALING_MAX_FREQ_ON_AC = "3000000";
      CPU_SCALING_MIN_FREQ_ON_BAT = "200000";
      CPU_SCALING_MAX_FREQ_ON_BAT = "2000000";
      CPU_BOOST_ON_AC = "0";
      CPU_BOOST_ON_BAT = "0";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      NMI_WATCHDOG = "0";
      AHCI_RUNTIME_PM_ON_AC = "on";
      AHCI_RUNTIME_PM_ON_BAT = "auto";
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
      RADEON_DPM_STATE_ON_AC = "auto";
      RADEON_DPM_STATE_ON_BAT = "auto";
      WIFI_PWR_ON_AC = "on";
      WIFI_PWR_ON_BAT = "on";
      WOL_DISABLE = "Y";
      SOUND_POWER_SAVE_ON_AC = "0";
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
