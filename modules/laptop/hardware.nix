{ config, pkgs, ... }:

{
  # Laptop-specific hardware settings

  # Touchpad is configured via libinput in config.kdl (home manager)
  # libinput.enable is auto-provided by dms-greeter

  # Laptop power management
  services.power-profiles-daemon.enable = true;

  # Thermals
  services.thermald.enable = true;
}
