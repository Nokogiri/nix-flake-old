{ pkgs, ... }:{
  programs.wlogout = {
    enable = true;
    #layout = [
    #  {
    #    label = "lock";
    #    action = "swaylock";
    #    text = "Lock";
    #  }
    #];
    style = ''
      button {
        color: #FFFFFF;
        background-color: #1E1E1E;
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 50%;
      }
      #lock {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/logout.png"));
      }
      #logout {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/reboot.png"));
      }
    '';
  };
}
