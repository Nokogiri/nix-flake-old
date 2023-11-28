{ pkgs, inputs, ... }: 
  let 
  anypkg = inputs.anyrun.packages.${pkgs.system};
  in
  {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        inputs.anyrun.packages.${pkgs.system}.applications
        anypkg.symbols
        anypkg.shell
        anypkg.rink
    ];
      width = { fraction = 0.3; };
      # = "top";
      #verticalOffset = { absolute = 0; };
      
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
    extraCss = ''
      #window {
        background-color: rgba(0, 0, 0, 100);

      }
    '';
  };
}
