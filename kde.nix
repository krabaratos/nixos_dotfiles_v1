{ config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Optional: add KDE apps
  environment.systemPackages = with pkgs; [
    darkly
    kdePackages.kate
    kdePackages.kdialog
    kdePackages.flatpak-kcm
    kdePackages.sddm-kcm
    kdePackages.kpipewire
    libportal-qt6
    sddm-sugar-dark
  ];
}
