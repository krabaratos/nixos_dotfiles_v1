{ pkgs, config, ... }:
{
  imports = [
  ];

  options = {
  };

  config = {
    programs.steam = {
      enable = true; # install steam
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

environment.systemPackages = with pkgs; [
gamemode
gamescope
goverlay
heroic-unwrapped
lutris-unwrapped
mangohud
steam-run
];
  };
}
