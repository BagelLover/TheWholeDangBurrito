{ config, pkgs, ... }:

{
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };

  environment.systemPackages = with pkgs; [
    monado
    opencomposite
    openxr-loader
  ];

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };

  services.udev.extraRules = ''
  # Bigscreen Beyond
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="35bd", ATTRS{idProduct}=="0101", MODE="0660", GROUP="users"
  # Bigscreen Bigeye
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="35bd", ATTRS{idProduct}=="0202", MODE="0660", GROUP="users"
  # Bigscreen Beyond Audio Strap
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="35bd", ATTRS{idProduct}=="0105", MODE="0660", GROUP="users"
  # Bigscreen Beyond Firmware Mode?
  KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="35bd", ATTRS{idProduct}=="4004", MODE="0660", GROUP="users"
'';
  services.udev.packages = [ pkgs.monado ];

  hardware.steam-hardware.enable = true;
}
