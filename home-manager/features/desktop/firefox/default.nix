{ config, pkgs, lib, inputs, ... }: {

  home.file.".mozilla/dracula" = {
    recursive = true;
    source = ./userChrome;
  };

  #programs.firefox.nativeMessagingHosts = [ pkgs.ff2mpv-rust ];
  programs.firefox = {
    enable = true;
    profiles.nokogiri.extensions = with config.nur.repos.rycee.firefox-addons; [
      vimium
      ublock-origin
      onetab
      improved-tube
      bitwarden
      dracula-dark-colorscheme
      sidebery
      sponsorblock
      iina-open-in-mpv
    ];
    profiles.nokogiri = {
      name = "nokogiri";
      path = "nokogiri";
      bookmarks = { };
      id = 0;
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = false;
        #"signon.rememberSignons" = false;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.disableResetPrompt" = true;
        "media.hardwaremediakeys.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.color-mix.enabled" = true;
        "browser.tabs.tabMinWidth" = 66;
        "browser.tabs.tabClipWidth" = 86;
        "browser.tabs.tabmanager.enabled" = false;
        "apz.fling_min_velocity_threshold" = 1.9;
        "apz.fling_friction" = 1.5e-2;
        # hw video decoding
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enable" = true;
        #"browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["ublock0_raymondhill_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":3}'';
      };
      extraConfig = ''
                
        user_pref("nglayout.initialpaint.delay", 250); // DEFAULT; formerly 250
        user_pref("nglayout.initialpaint.delay_in_oopif", 250); // DEFAULT
        user_pref("content.notify.interval", 100000); // (.10s); default=120000 (.12s)
        user_pref("gfx.canvas.accelerated.cache-items", 4096); // default=2048; alt=8192
        user_pref("gfx.canvas.accelerated.cache-size", 512); // default=256; alt=1024
        user_pref("gfx.content.skia-font-cache-size", 20); // default=5; Chrome=20
        user_pref("browser.cache.jsbc_compression_level", 3);
        user_pref("media.memory_cache_max_size", 65536); // default=8192; AF=65536; alt=131072
        user_pref("media.cache_readahead_limit", 7200); // 120 min; default=60; stop reading ahead when our buffered data is this many seconds ahead of the current playback
        user_pref("media.cache_resume_threshold", 3600); // 60 min; default=30; when a network connection is suspended, don't resume it until the amount of buffered data falls below this threshold
        user_pref("image.mem.decode_bytes_at_a_time", 32768); // default=16384; alt=65536; chunk size for calls to the image decoders
        user_pref("network.buffer.cache.size", 262144); // 256 kb; default=32768 (32 kb)
        user_pref("network.buffer.cache.count", 128); // default=24
        user_pref("network.http.max-connections", 1800); // default=900
        user_pref("network.http.max-persistent-connections-per-server", 10); // default=6; download connections; anything above 10 is excessive
        user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5); // default=3
        user_pref("network.http.pacing.requests.enabled", false);
        user_pref("network.dnsCacheExpiration", 3600); // keep entries for 1 hour
        user_pref("network.dns.max_high_priority_threads", 8); // default=5
        user_pref("network.ssl_tokens_cache_capacity", 10240); // default=2048; more TLS token caching (fast reconnects)
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.prefetch-next", false);
        user_pref("network.predictor.enabled", false);
        user_pref("layout.css.grid-template-masonry-value.enabled", true);
        user_pref("dom.enable_web_task_scheduling", true);
        user_pref("layout.css.has-selector.enabled", true);
        user_pref("dom.security.sanitizer.enabled", true);
      '';
      userChrome = ''
        @import url("${
          builtins.fetchurl {
            url =
              "https://github.com/MrOtherGuy/firefox-csshacks/raw/master/chrome/hide_tabs_toolbar.css";
            sha256 = "sha256-60fv8C7+nj7mUTAfMnfGTcEcdba2XUXfPnvzYluKzaw=";
          }
        }");
        /*@import url("${
          builtins.fetchurl {
            url =
              "https://github.com/MrOtherGuy/firefox-csshacks/raw/master/chrome/window_control_placeholder_support.css";
            sha256 = "sha256-q1BC2VHTYxwqr8PAt93GrIF+owDnzlI1ozLIkYQf9ac=";
          }
        }");*/
        /* Remove close button*/ .titlebar-buttonbox-container{ display:none }
        #PersonalToolbar{
          position: absolute;
          display: flex;
          z-index: 1;
        } 
      '';
    };

    profiles.private.extensions = with config.nur.repos.rycee.firefox-addons; [
      vimium
      ublock-origin
      onetab
      
      sidebery
      sponsorblock
      
      dracula-dark-colorscheme
      iina-open-in-mpv
    ];
    profiles.private = {
      name = "private";
      path = "private";
      bookmarks = { };
      id = 1;
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;
        #"signon.rememberSignons" = false;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.disableResetPrompt" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.color-mix.enabled" = true;
        "browser.tabs.tabMinWidth" = 66;
        "browser.tabs.tabClipWidth" = 86;
        "browser.tabs.tabmanager.enabled" = false;
        "apz.fling_min_velocity_threshold" = 1.9;
        "apz.fling_friction" = 1.5e-2;
        #  hw video decoding
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enable" = true;
        #"browser.uiCustomization.state" = ''
        #  {"placements":{"widget-overflow-fixed-list":["ublock0_raymondhill_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":3}'';
      };
      userChrome = ''
        @import url("${
          builtins.fetchurl {
            url =
              "https://github.com/MrOtherGuy/firefox-csshacks/raw/master/chrome/hide_tabs_toolbar.css";
            sha256 = "sha256-60fv8C7+nj7mUTAfMnfGTcEcdba2XUXfPnvzYluKzaw=";
          }
        }");
        /*@import url("${
          builtins.fetchurl {
            url =
              "https://github.com/MrOtherGuy/firefox-csshacks/raw/master/chrome/window_control_placeholder_support.css";
            sha256 = "sha256-q1BC2VHTYxwqr8PAt93GrIF+owDnzlI1ozLIkYQf9ac=";
          }
        }");*/
        /* Remove close button*/ .titlebar-buttonbox-container{ display:none } 
      '';
    };
  };
}
