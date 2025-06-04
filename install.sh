
sudo pacman -Syu zsh zsh-autosuggestions zsh-syntax-highlighting neovim rust cargo atuin python3 nodejs npm fzf tmux unzip make cmake xclip neofetch
sudo pacman -Syu waybar 

sudo pacman -S ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo pkgconf cmake libglvnd wayland hyprutils hyprwayland-scanner hyprlang

sudo pacman -S linux-firmware wireplumber pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-audio pavucontrol
sudo pacman xdg-desktop-portal xdg-desktop-portal-wlr grim
 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sS https://starship.rs/install.sh | sh


