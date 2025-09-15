{...}: {
  programs = {
    bash = {
      enable = true;
    };
    fish = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      autosuggestions.strategy = ["history"];
      enableBashCompletion = true;
      enableLsColors = true;
      histSize = 100000;
      histFile = "$HOME/.zsh_history";
      setOptions = [
      ];
      shellAliases = {
        c = "clear";
        ls = "eza --icons";
        l = "ls -l";
        la = "ls -a";
        lla = "ls -la";
        lt = "eza --tree";
        lti = "ls --tree";
        cat = "bat --plain";
        # cleanram = "sudo sh -c '\''sync; echo 3 > /proc/sys/vm/drop_caches'\";
        cp = "cp -vr";
        mkdir = "mkdir -p";
        mv = "mv -v";
        q = "exit";
        rm = "rm -vr";
        code = "codium";
        nreb = "sudo nixos-rebuild switch --flake";
        fzf = "sk";
      };
    };
    starship = {
      enable = true;
    };
  };
}
