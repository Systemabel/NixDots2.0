{...}: let
  universalAliases = {
    c = "clear";
    q = "exit";

    ls = "eza --icons";
    l = "eza -l --icons";
    la = "eza -a --icons";
    lla = "eza -la --icons";
    lt = "eza --tree";
    lti = "eza --tree --icons";

    cat = "bat --plain";
    cp = "cp -vr";
    mkdir = "mkdir -pv";
    mv = "mv -v";
    rm = "rm -vr";

    code = "codium";

    nixrbd = "nh os switch -a";
    nixup = "nh os switch -au";

    fzf = "sk";
    ns = "nix-search-tv print | sk --preview 'nix-search-tv preview {}'";
    ntv = "tv nix-search";
    y = "yazi";
  };
in {
  programs = {
    bash.shellAliases = universalAliases;
    fish.shellAliases = universalAliases;
    zsh.shellAliases = universalAliases;
  };
}
