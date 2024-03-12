{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      #fg = "#f8f8f2";
      #bg = "#282a36";
      fg = "-1";
      bg = "-1";
      hl = "#bd93f9";
      "fg+" = "#f8f8f2";
      "bg+" = "#44475a";
      "hl+" = "#bd93f9";
      info = "#ffb86c";
      prompt = "#50fa7b";
      pointer = "#ff79c6";
      marker = "#ff79c6";
      spinner = "#ffb86c";
      header = "#6272a4";
    };
    defaultOptions = [
      "--preview-window='border-rounded'"
      "--prompt=' '"
      "--marker='󰄳'"
      "--pointer='🠶'"
    ];
  };
}
