{
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      sync.enable = false;
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:58:0:0";
    };
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver   # iHD (Gen9+ incl. 10th gen)
      vaapiIntel           # fallback (optional but harmless)
    ];
  };

}
