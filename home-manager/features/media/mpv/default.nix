{ pkgs, lib, ... }:
{
  programs.mpv = {
    enable = true;
    bindings = {
      "right" = "seek 5; script-binding uosc/flash-timeline";
      "left" = " seek -5; script-binding uosc/flash-timeline";
      "shift+right" = "seek  30; script-binding uosc/flash-timeline";
      "shift+left" = "seek -30; script-binding uosc/flash-timeline";
      "m" = "cycle mute; script-binding uosc/flash-volume";
      "up" = "add volume  10; script-binding uosc/flash-volume";
      "down" = "add volume -10; script-binding uosc/flash-volume";

      "mbtn_right" = "script-binding uosc/menu";
      "menu" = "script-binding uosc/menu";
      "alt+m" = "script-binding uosc/menu";
      "o" = "script-binding uosc/open-file";
      "alt+s" = "script-binding uosc/load-subtitles";
      "S" = "script-binding uosc/subtitles";
      "A" = "script-binding uosc/audio";
      "ctrl+f" = "script-binding uosc/stream-quality";
      "ctrl+s" = "async screenshot";
      "C" = "script-binding uosc/chapters";
      "q" = "quit";
    };
    config = {
      ao = "pipewire";
      hwdec = "auto";
      gpu-hwdec-interop = "vaapi";
      gpu-api = "vulkan";
      vo = "gpu";
      vulkan-async-compute = true;
      vulkan-async-transfer = true;
      vulkan-queue-count = 1;
      deband = false;
      ytdl-format = "bestvideo[vcodec^=avc1][height<=?1080]+bestaudio/best";
      osc = false;
      osd-bar = false;
      osd-font = "sans";
      osd-font-size = 28;
      osd-level = 1;
      border = false;
      force-window = "immediate";
      save-position-on-quit = true;

      volume = 100;

      screenshot-format = "png";
      screenshot-png-compression = 8;
      screenshot-template = "~/Pictures/Screenshots/%F_(%P)_%n";

      cache = true;
      demuxer-max-bytes = "400MiB";
      demuxer-max-back-bytes = "300MiB";

      cursor-autohide-fs-only = true;
      cursor-autohide = "20";
      input-ipc-server = "/tmp/mpvsocket";
    };
    scriptOpts = {
      ytdl_hook = {
        ytdl_path = "${pkgs.yt-dlp}/bin/yt-dlp";
      };
    };
    scripts = with pkgs; [
      mpvScripts.mpris
      mpvScripts.uosc
      #mpvScripts.thumbfast
      mpvScripts.sponsorblock
      #mpvScripts.simple-mpv-webui
    ];
  };
  xdg.configFile."mpv/script-opts/uosc.conf".source = ./uosc.conf;

  home.packages = with pkgs; [ open-in-mpv ];
}
