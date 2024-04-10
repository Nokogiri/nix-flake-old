{
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        #"calvin" = { hostname = "10.200.200.1"; };
        #"gitlab.com" = { user = "gitolite"; };
        #"github.com" = { user = "git"; };
        "fishoeder" = {
          user = "nokogiri";
          hostname = "10.200.200.1";
        };
        homeassistant = {
          user = "nokogiri";
        };
        "codeberg.org" = {
          user = "git";
        };
        "forge.fishoeder.net" = {
          user = "forgejo";
        };
      };
    };
  };
}
