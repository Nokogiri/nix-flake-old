{ pkgs, ... }:
{
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
      * {
        background-image: none;
      }
      window {
       background-color: rgba(40, 42, 54, 0.9); 
      }
      button {
        color: #F8F8F2;
        background-color: rgba(40, 42, 54, 0.0);
        border-style: solid;
        border-width: 0px;
        border-radius: 8;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 50%;
      }
      button:focus, button:active, button:hover {
        background-color: rgba(214, 172, 255, 0.5);
        color: #282A36;
        outline-style: none;
      }
      #lock {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/logout.png"));
      }
      #logout {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/logout.png"));
      }
      #suspend {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/suspend.png"));
      }
      #hibernate {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/hibernate.png"));
      }
      #shutdown {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/shutdown.png"));
      }
      #reboot {
        background-image: image(url("${pkgs.Imaginarium}/wlogout/reboot.png"));
      }
    '';
  };
}
