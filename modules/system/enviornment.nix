{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git gh python3
    intel-gpu-tools mesa pciutils powertop polychromatic
    ntfs3g gvfs openssl sshfs
  ];
}

