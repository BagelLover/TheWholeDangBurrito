{ pkgs, ... }:
{
  users.users.luke = {
    isNormalUser = true;
    description = "Luke";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "openrazer" "plugdev" "fuse" "docker" ];
  };

  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;
}
