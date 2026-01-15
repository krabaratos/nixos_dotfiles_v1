{ config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    wayland.enable = true;
    extraPackages = with pkgs; [ 
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
      kdePackages.qtbase ];
  };
  services.desktopManager.plasma6.enable = true;

  # Optional: add KDE apps
  environment.systemPackages = with pkgs; [
    darkly
    kdePackages.kate
    kdePackages.kdialog
    kdePackages.flatpak-kcm
    kdePackages.sddm-kcm
    kdePackages.kpipewire
    kdePackages.kcalc
    libportal-qt6
    sddm-astronaut
  ];
}



