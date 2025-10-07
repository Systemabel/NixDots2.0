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
      interactiveShellInit = ''
        eval "$(starship init zsh)"

        if [ -x "$(command -v tmux)" ] && [ -n "$DISPLAY" ] && [ -z "$TMUX" ]; then
          exec tmux new-session -A -s $USER >/dev/null 2>&1
        fi
      '';
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
        "AUTO_CD"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_IGNORE_DUPS"
        "HIST_FIND_NO_DUPS"
        "SHARE_HISTORY"
      ];
    };
  };
}
