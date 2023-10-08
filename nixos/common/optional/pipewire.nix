{ pkgs, ... }: {
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
    #"wireplumber/main.lua.d/51-disable-suspension.lua".text = ''
    #        table.insert (alsa_monitor.rules, {
    #    matches = {
    #      {
    #        -- Matches all sources.
    #        { "node.name", "matches", "alsa_input.*" },
    #      },
    #      {
    #        -- Matches all sinks.
    #        { "node.name", "matches", "alsa_output.*" },
    #      },
    #    },
    #    apply_properties = {
    #      ["session.suspend-timeout-seconds"] = 0,  -- 0 disables suspend
    #    },
    #  })
    #'';
  };
  #environment.etc."pipewire/pipewire.conf.d/92-low-latency.conf" = {
  #  text = ''
  #    context.properties = {
  #      default.clock.rate = 44100
  #      default.clock.quantum = 32
  #      default.clock.min-quantum = 32
  #      default.clock.max-quantum = 32
  #    }
  #  '';
  #};
  #environment.etc."pipewire/pipewire-pulse.d/92-low-latency.conf" =
  #  let json = pkgs.formats.json { };
  #  in {
  #    source = json.generate "92-low-latency.conf" {
  #      context.modules = [{
  #        name = "libpipewire-module-protocol-pulse";
  #        args = {
  #          pulse.min.req = "32/44100";
  #          pulse.default.req = "32/44100";
  #          pulse.max.req = "32/44100";
  #          pulse.min.quantum = "32/44100";
  #          pulse.max.quantum = "32/44100";
  #        };
  #      }];
  #      stream.properties = {
  #        node.latency = "32/44100";
  #        resample.quality = 1;
  #      };
  #    };
  #  };
}
