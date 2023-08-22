{ pkgs, lib, ... }: {
  programs.mpv = {
    enable = true;
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
      osd-font-size = 24;
      osd-level = 1;
      border = false;
      force-window = "immediate";
      save-position-on-quit = true;

      volume = 100;

      screenshot-format = "png";
      screenshot-png-compression = 8;
      screenshot-template = "'~/Pictures/Screenshots/%F_(%P)_%n'";

      cache = true;
      demuxer-max-bytes = "400MiB";
      demuxer-max-back-bytes = "300MiB";

      script-opts = "ytdl_hook-ytdl_path=${pkgs.yt-dlp}/bin/yt-dlp";
    };
  };
}
