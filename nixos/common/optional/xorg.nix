{ pkgs, ... }:{
  services.xserver = {
    enable = true;
    videoDrivers = [
      "amdgpu"
      "modesetting"
      "fbdev"
    ];
  };
}
