{
  users.users.luke = {
    isNormalUser = true;
    description = "Luke";
    extraGroups = [ "networkmanager" "wheel" "openrazer" "plugdev" "fuse" "docker" ];
  };
  nixpkgs.config.allowUnfree = true;
}
