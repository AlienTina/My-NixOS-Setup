{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        fastfetch
        firefox
        git
        vscode
        rofi-wayland
        hyprls
        hyprcursor
        xcur2png
        vesktop
        waybar
        hyprpaper
        kdePackages.qtwayland
        kdePackages.qtsvg
        kdePackages.breeze
        kdePackages.breeze-icons
        libsForQt5.qt5ct
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        kdePackages.kdegraphics-thumbnailers
        libsForQt5.ffmpegthumbs
        kdePackages.kio-fuse
        kdePackages.kio-extras
        pavucontrol
        strawberry-qt6
        wlogout
        pywal
        xarchiver
	    micro
	    vlc
	    mpv
	    kdePackages.kdenlive
		gimp
		gwenview
		btop
		libreoffice-qt
		hunspell
		hunspellDicts.sk_SK
		grim
        slurp
		wl-clipboard
		grimblast
		pipes
	    nwg-look
	    tty-clock
	    playerctl
	    nicotine-plus
	    brightnessctl
	    ddcutil
	    lutris
	    ani-cli
	    manga-tui
	    polychromatic
	    dotnetCorePackages.dotnet_9.sdk
	    dotnetCorePackages.dotnet_9.runtime
	    jetbrains.rider
	    audacity
	    qbittorrent-enhanced
	    nsz
	    jdk8
	    jdk17
    ];
    fonts.packages = with pkgs; [
        font-awesome
        powerline-fonts
        powerline-symbols
        hack-font
    ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    programs.thunar.enable = true;
    services.flatpak.enable = true;
    programs.fish.enable = true;
    programs.bash = {
    interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    services.gvfs.enable = true;
    services.tumbler.enable = true;
    programs.tmux = {
    	enable = true;
    	clock24 = true;
    	extraConfig = ''

    	'';
    };
    programs.hyprlock.enable = true;
    programs.direnv.nix-direnv.enable = true;
}
