{ config, pkgs, ... }: {
  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      kernelModules = [ "i915" "nvidia" ];
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      # Power management optimizations
      "intel_pstate=active"
      "intel_idle.max_cstate=9"
      "pcie_aspm=force"
      "nmi_watchdog=0"
      # NVIDIA power management
      "nvidia.NVreg_DynamicPowerManagement=0x02"
      "nvidia.NVreg_EnableStreamMemOPs=1"
      # NVIDIA DRM modeset (required for Wayland)
      "nvidia-drm.modeset=1"
    ];
    kernelModules = [ "fuse" "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    loader = {
      timeout = 0;
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
