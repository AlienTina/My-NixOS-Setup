set -gx DOTNET_ROOT "/nix/store/vhvgizfqfcgzwjaslbyca10yx3h9fn7k-dotnet-sdk-9.0.101/share/dotnet/"

if status is-interactive
    alias hyprfetch="fastfetch --logo ~/Pictures/hyprchan.png --logo-height 24" 
    wal -R
    direnv hook fish | source
    clear
    # Commands to run in interactive sessions can go here
end
