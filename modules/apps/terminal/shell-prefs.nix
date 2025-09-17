{lib, ...}: {
  programs = {
    bash = {
      enable = lib.mkDefault true;
    };
    fish = {
      enable = lib.mkDefault true;
    };

    zsh = {
      enable = lib.mkDefault true;
      vteIntegration = true;
      # History
      histSize = 100000;
      # Syntax Highlighting
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "regexp"
          "root"
          "line"
        ];
      };
      # Completion
      enableCompletion = true;
      # Autosuggestions
      autosuggestions = {
        enable = true;
        strategy = ["history" "completion"];
        extraConfig = {
          "ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE" = "20";
        };
      };
      enableLsColors = true;
      setOptions = [
        "SHARE_HISTORY"
        "HIST_IGNORE_ALL_DUPS"
        "AUTO_CD"
      ];
    };
  };
}
