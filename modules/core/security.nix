{ config, pkgs, ... }:

  security = {
    rtkit.enable = true;
    allowUserNamespaces = true;
  };
}
