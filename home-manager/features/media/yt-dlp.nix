{
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
      embed-metadata = true;
      embed-subs = true;
      ignore-errors = true;
      sub-langs = "all";
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
      output = "~/Videos/%(title)s.%(ext)s";
    };
  };
}
