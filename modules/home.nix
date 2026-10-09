{ pkgs, ... }:

{
  # User details
  home.username = "yourusername"; # Must match the username in common.nix
  home.homeDirectory = "/home/yourusername";

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
    userName = "Your Name";
    userEmail = "your.email@example.com";
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
