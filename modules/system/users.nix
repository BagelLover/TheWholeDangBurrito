{
  users.users.luke = {
    isNormalUser = true;
    description = "Luke";
    extraGroups = [ "networkmanager" "wheel" "openrazer" "plugdev" "fuse" ];
  };
  nixpkgs.config.allowUnfree = true;
}

