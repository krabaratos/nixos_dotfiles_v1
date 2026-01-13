{ config, pkgs, ... }:

{
    #AMD GPU Drivers
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
 };

  # Optional: add KDE apps
  environment.systemPackages = with pkgs; [
     mesa 
     vulkan-loader 
     vulkan-tools 
     vulkan-validation-layers
    
  ];
}
