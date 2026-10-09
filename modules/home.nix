{ pkgs, ... }:

{
  # User details
  home.username = "domenik"; # Must match the username in common.nix
  home.homeDirectory = "/home/domenik";

  # User packages available on both machines
  home.packages = with pkgs; [
    # Terminal utilities
    ripgrep     # Fast search
    fd          # Simple find alternative
    eza         # Modern replacement for 'ls'
    bat         # Modern replacement for 'cat'
    fastfetch   # System information display
    
    # Applications
    firefox
  ];

  # Git Configuration
  programs.git = {
    enable = true;
    userName = "domenik-d";
    userEmail = "pyradox11@gmail.com";
  };

  programs.plasma = {
    enable = true;

    # Workspace appearance
    workspace = {
      clickToOpenHasEffect = false;
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Elarun/";
    };

    # Hotkeys / Shortcuts
    shortcuts = {
      ksmserver = {
        "Lock Session" = "Meta+L";
      };
      kwin = {
        "Expose" = "Meta+F10";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
      };
    };

    # Window rules
    configFile = {
      "kdeglobals"."General"."font" = "Noto Sans,10,-1,5,50,0,0,0,0,0";
    };
  };

  # Zsh Shell Configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Useful shell aliases shared across systems
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons";
      cat = "bat";
      rebuild-desktop = "sudo nixos-rebuild switch --flake ~/.config/nixos#desktop";
      rebuild-thinkpad = "sudo nixos-rebuild switch --flake ~/.config/nixos#thinkpad";
    };
  };

  # Starship prompt (clean cross-shell prompt)
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Do not change this value
  home.stateVersion = "24.05";
}
