{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # You can safely remove all of these. They're just things I use in my life.
    # replace them with things you like!
    via
    # mgba
    plasticity
    # texliveFull
    # zathura
    # TODO check plasticity license will last through rebuilds
  ];
}
