{ config, pkgs, ... }:

{
    #AMD GPU Drivers
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
 };

  #AMD GPU Driver Packages
  environment.systemPackages = with pkgs; [
     mesa 
     vulkan-loader 
     vulkan-tools 
     vulkan-validation-layers
    
  ];
}
