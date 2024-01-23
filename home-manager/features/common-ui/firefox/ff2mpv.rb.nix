{ pkgs, ... }: {
  #home.file.".local/bin/ff2mpv.py" = {
  home.packages = [
    pkgs.ruby
    (pkgs.writeTextFile {
      name = "ff2mpv";
      destination = "/bin/ff2mpv";
      executable = true;
      text = ''
        #!${pkgs.ruby}/bin/ruby
        # frozen_string_literal: true

        require "json"

        len = $stdin.read(4).unpack1("L")
        data = JSON.parse($stdin.read(len))
        url = data["url"]

        args = %w[--no-terminal]

        pid = spawn "mpv", *args, "--", url, in: :close, out: "/dev/null", err: "/dev/null"

        Process.detach pid        
      '';
    })
  ];
}
