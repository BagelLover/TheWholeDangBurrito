{ pkgs, spicetify-nix, ... }:

{
  home.packages = with pkgs; [
    vesktop
    nautilus
    celluloid
    loupe
    deskflow
    davinci-resolve-studio
    audacity
    zed-editor
    prismlauncher
    impression
    thunderbird
    pywalfox-native
    librewolf
    linux-router
    krita
    azahar
    qbittorrent
    ns-usbloader
  ];

  # Environment variables (optional)
  home.sessionVariables = {
    EDITOR = "zed";
    TERMINAL = "ghostty";
  };
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dankcolors";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.spicetify =
  let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
    ];
    enabledSnippets = with spicePkgs.snippets; [
      pointer
    ];

    theme = spicePkgs.themes.sleek;
    colorScheme = "custom";
    customColorScheme = {
      text               = "FFFFFF";
      subtext            = "DEDEDE";
      nav-active-text    = "000000";
      main               = "000000";
      sidebar            = "000000";
      player             = "000000";
      card               = "000000";
      shadow             = "000000";
      main-secondary     = "292929";
      button             = "1DB954";
      button-secondary   = "DEDEDE";
      button-active      = "1DB954";
      button-disabled    = "2f2f2f";
      nav-active         = "DEDEDE";
      play-button        = "DEDEDE";
      tab-active         = "292929";
      notification       = "292929";
      notification-error = "292929";
      playback-bar       = "DEDEDE";
      misc               = "FFFFFF";
    };
  };
}
