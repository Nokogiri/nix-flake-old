{
  services.gammastep = {
    enable = true;
    latitude = "50.9787";
    longitude = "11.03283";
    provider = "geoclue2";
    settings = {
      general = {
        adjustment-method = "wayland";
        fade = "0";
      };
    };
    temperature = {
      day = 6500;
      night = 4500;
    };
  };
}
