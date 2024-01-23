{ config, ... }: {
  home.file.".mozilla/native-messaging-hosts/ff2mpv.json".text = ''
    {
      "name": "ff2mpv",
      "description": "ff2mpv's external manifest",
      "path": "/etc/profiles/per-user/${config.home.username}/bin/ff2mpv",
      "type": "stdio",
      "allowed_extensions": ["ff2mpv@yossarian.net"]
    }
  '';
}
