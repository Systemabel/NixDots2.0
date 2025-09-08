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
        # cleanram = "sudo sh -c '\''sync; echo 3 > /proc/sys/vm/drop_caches'\";
        cp = "cp -vr";
        mkdir = "mkdir -p";
        mv = "mv -v";
        q = "exit";
        rm = "rm -vr";
        code = "codium";
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
