{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 1714 1715 1716 1717 1718 1719 1720 ];
    firewall.allowedUDPPorts = [ 1714 1715 1716 1717 1718 1719 1720 ];
  };
}

