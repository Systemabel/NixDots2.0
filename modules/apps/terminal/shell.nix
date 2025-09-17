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

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "colored-man-pages"
          "command-not-found"
          "direnv"
        ];
      };

      shellAliases = {
        c = "clear";
        q = "exit";

        ls = "eza --icons";
        l = "ls -l";
        la = "ls -a";
        lla = "ls -la";
        lt = "eza --tree";
        lti = "ls --tree";

        cat = "bat --plain";
        # cleanram = "sudo sh -c '\''sync; echo 3 > /proc/sys/vm/drop_caches'\";
        cp = "cp -vr";
        mkdir = "mkdir -pv";
        mv = "mv -v";
        rm = "rm -vr";

        code = "codium";

        nrs = "sudo nixos-rebuild switch --flake";
        nrt = "sudo nixos-rebuild test --flake";
        nfu = "nix flake update";

        fzf = "sk";
        ns = "nix-search-tv print | sk --preview 'nix-search-tv preview {}'";
        y = "yazi";
      };
    };
    starship = {
      enable = lib.mkDefault true;
    };
  };
}
