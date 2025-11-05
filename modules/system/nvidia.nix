{
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      sync.enable = false;
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:58:0:0";
    };
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };
}

