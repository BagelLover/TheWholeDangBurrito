{ ... }: {
  services = {
    system76-scheduler.settings.cfsProfiles.enable = true;
    power-profiles-daemon.enable = false;
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_MAX_PERF_ON_BAT = 50;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_BOOST_ON_BAT = 0;
        CPU_BOOST_ON_AC = 1;
        PCIE_ASPM_ON_BAT = "powersupersave";
        PCIE_ASPM_ON_AC = "default";
        NVME_APST_ON_BAT = "1";
        NVME_APST_ON_AC = "0";
        SOUND_POWER_SAVE_ON_BAT = "1";
        SOUND_POWER_SAVE_ON_AC = "0";
        RUNTIME_PM_ON_BAT = "auto";
        RUNTIME_PM_ON_AC = "on";
        USB_AUTOSUSPEND = 1;
        WIFI_PWR_ON_BAT = "on";
      };
    };
  };
}

