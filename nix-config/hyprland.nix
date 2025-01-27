{ config, pkgs, ...}:

{
    hardware.graphics = {
      enable = true;
    };
    services.xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    programs.hyprland.withUWSM = true;
    environment.systemPackages = [
      pkgs.kitty
    ];
    
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

     xdg.portal = {
       enable = true;
       config = {
         hyprland = {
           default = [
             "hyprland"
             "kde"
           ];
         };
       };
       configPackages = with pkgs; [
         xdg-desktop-portal-hyprland
         kdePackages.xdg-desktop-portal-kde
       ];
     };
}
