{pkgs, ...}: {
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
      histSize = 100000;
      shellAliases = {
        ls = "eza --icons";
        l = "ls -l";
        la = "ls -a";
        lla = "ls -la";
        lt = "exa --tree";
        lti = "ls --tree";
        cat = "bat --color always";
        cleanpac = "sudo pacman -Rns $(pacman -Qtdq); paru -c";
        # cleanram = "sudo sh -c '\''sync; echo 3 > /proc/sys/vm/drop_caches'\";
        cp = "cp -vr";
        mkdir = "mkdir -p";
        mv = "mv -v";
        # pac = "pacman -Q | fzf"
        q = "exit";
        rm = "rm -vr";
        yeet = "paru -Rsu";
        pamcan = "pacman";
      };
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      # flake = "/home/${}/flake";
    };
    starship = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    ghostty
    kitty
  ];
}
