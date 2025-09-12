{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    via
    plasticity
    # TODO check plasticity license will last through rebuilds
  ];
}
