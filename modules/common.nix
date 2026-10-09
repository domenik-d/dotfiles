{ pkgs, ... }:

{
  # Set your time zone & locale
  time.timeZone = "Europe/Berlin"; # Change to your local timezone
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable networking with NetworkManager
  networking.networkmanager.enable = true;

  # Enable the Flakes feature and modern Nix CLI tools
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages (e.g. proprietary drivers, Steam, Spotify)
  nixpkgs.config.allowUnfree = true;

  # Define your primary user account
  users.users.domenik = { # Replace 'yourusername' with your actual username
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh; # Sets Zsh as default user shell
  };

  # Essential system-wide CLI packages
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    htop
    pciutils  # Useful for lspci hardware debugging
    usbutils  # Useful for lsusb
  ];

  # Enable Zsh system-wide to ensure environment variables load correctly
  programs.zsh.enable = true;

  # Audio setup using PipeWire (modern replacement for PulseAudio)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Do not change this value after initial system installation
  system.stateVersion = "24.05";
}
