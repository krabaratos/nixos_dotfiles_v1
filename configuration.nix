{ config, pkgs, ... }:

{
  imports =
    [
     ./hardware-configuration.nix
     ./gaming.nix
     ./kde.nix
    ];

 #Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; #Flakes
  nixpkgs.config.allowUnfree = true; #unfree
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use Xanmod kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  #Service X11
  services.xserver.enable = true; #X11
   services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #Flatpak
  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;


   # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

   #AMD GPU Drivers
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
     mesa 
     vulkan-loader 
     vulkan-tools 
     vulkan-validation-layers
    ];
  };
  
  #User Settings
  users.users.manish = {
    isNormalUser = true;
    description = "Manish Meena";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      
    ];
  };

  #System Level packages
  environment.systemPackages = with pkgs; [
appimage-run
discord
firefox
flatpak-xdg-utils
htop
javaPackages.compiler.openjdk21
jdk21_headless
jre21_minimal
neofetch
 ];

  system.stateVersion = "25.11"; 

}
