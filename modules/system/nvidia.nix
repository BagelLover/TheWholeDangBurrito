{
  hardware.nvidia = {
    config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    persistenceMode = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };
}
