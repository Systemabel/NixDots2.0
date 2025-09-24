{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    via
    plasticity
    mgba
    # TODO check plasticity license will last through rebuilds
  ];
}
