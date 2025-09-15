{...}: {
  swapDevices = [
    {
      device = "/persist/swap/swapfile";
      size = 20 * 1024;
      priority = 0;
    }
  ];
}
