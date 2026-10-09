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

  # OPTION A: If using an NVIDIA GPU, uncomment the following block:
  /*
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false; # Set to true if using modern Turing/Ampere+ GPUs with open drivers
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  */

  # OPTION B: If using an AMD GPU, open-source drivers (AMDGPU) are enabled by default.
  # Extra vulkan drivers can be specified here if needed:
  # hardware.graphics.extraPackages = with pkgs; [ amdvlk ];

  # ---------------------------------------------------------------------------
  # Desktop Applications & Game Support
  # ---------------------------------------------------------------------------
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports for Steam Remote Play
    dedicatedServer.openFirewall = true;
  };

  # Enable GameMode to optimize OS performance automatically when running games
  programs.gamemode.enable = true;

  # Desktop-specific utility packages
  environment.systemPackages = with pkgs; [
    corectrl # GPU/CPU monitoring and overclocking utility
    vlc      # Media player
  ];
}
