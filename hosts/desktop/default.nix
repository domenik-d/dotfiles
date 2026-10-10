{ pkgs, ... }:

{
  # Machine network identity
  networking.hostName = "desktop";

  # ---------------------------------------------------------------------------
  # Performance & CPU Tuning
  # ---------------------------------------------------------------------------
  # Lock CPU to high performance mode (ideal for desktop AC power)
  powerManagement.cpuFreqGovernor = "performance";

  # ---------------------------------------------------------------------------
  # Graphics Drivers
  # Select / uncomment the section matching your graphics hardware.
  # ---------------------------------------------------------------------------

  # Hardware acceleration defaults (OpenGL / Mesa)
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for 32-bit applications like Steam
  };

  #NVIDIA GPU
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false; # Set to true if using modern Turing/Ampere+ GPUs with open drivers
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
  # ---------------------------------------------------------------------------
  # Desktop Applications & Game Support
  # ---------------------------------------------------------------------------
  programs.steam = {
    enable = true;
  };

  # Enable GameMode to optimize OS performance automatically when running games
  programs.gamemode.enable = true;

  # Desktop-specific utility packages
  environment.systemPackages = with pkgs; [
    corectrl # GPU/CPU monitoring and overclocking utility
    vlc      # Media player
  ];
}
