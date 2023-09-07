{
  services.mbpfan = {
    enable = true;
    settings.general = {
      low_temp = 45;
      high_temp = 60;
      max_temp = 85;
      polling_interval = 2;
      min_fan1_speed = 2000;
    };
  };

}
