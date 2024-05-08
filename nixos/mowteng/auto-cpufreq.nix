{
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "ondemand";
        #energy_performance_preference = "balance_performance";
        scaling_min_freq = "400000";
        scaling_max_freq = "3000000";
        turbo = "auto";
      };
      battery = {
        governor = "ondemand";
        #energy_performance_preference = "power";
        scaling_min_freq = "400000";
        scaling_max_freq = "2000000";
        turbo = "auto";
      };
    };
  };
}
