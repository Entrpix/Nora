help() {
    echo "Nora - CLI Tool for Using AUR Packages on Non-Arch Based Distros"
    echo ""
    echo "Usage:"
    echo "  nora <command> [<args>]"
    echo ""
    echo "Available commands:"
    echo "  help - Display this message."
    echo "  init - Initialize Nora."
    echo "  update - Updates AUR packages."
    echo "  upgrade - Upgrades AUR packages."
    echo "  updg - Updates and upgrades AUR packages."
    echo "  install <package> - Install the AUR package <package>."
    echo "  export <package> - Export the AUR package <package> to your host application launcher."
    echo "  remove <package> - Remove the AUR package <package>."
    echo "  open <package> - Open the AUR package <package>."
}

init() {
    if [ ! -d ~/.config/nora ]; then
        mkdir ~/.config/nora
    fi

    if [ ! -f ~/.config/nora/nora.conf ]; then
        touch ~/.config/nora/nora.conf
    fi

    echo "Arch Distrobox Instance Name: "; read instance
    echo "$instance" > ~/.config/nora/nora.conf

    distro=$(cat ~/.config/nora/nora.conf)
}

update() {
    distro=$(cat ~/.config/nora/nora.conf)

    distrobox enter "$distro" -- yay -Syu
}

upgrade() {
    distro=$(cat ~/.config/nora/nora.conf)

    distrobox enter "$distro" -- yay -Su
}

updg() {
    distro=$(cat ~/.config/nora/nora.conf)

    distrobox enter "$distro" -- yay -Syu
}

install() {
    distro=$(cat ~/.config/nora/nora.conf)
    pkg=$1

    distrobox enter "$distro" -- yay -S $pkg
}

export() {
    distro=$(cat ~/.config/nora/nora.conf)
    pkg=$1

    distrobox enter "$distro" -- distrobox-export --app $pkg
}

remove() {
    distro=$(cat ~/.config/nora/nora.conf)
    distrobox enter "$distro" -- yay -R "$1"
}

open() {
    distro=$(cat ~/.config/nora/nora.conf)
    distrobox enter "$distro" -- "$1"

}

if ! command -v distrobox &> /dev/null
then
    echo "It appears that Distrobox is not installed."
    exit
fi

if [ "$1" == "help" ]; then
    help
elif [ "$1" == "init" ]; then
    init
elif [ "$1" == "update" ]; then
    update
elif [ "$1" == "upgrade" ]; then
    upgrade
elif [ "$1" == "updg" ]; then
    updg
elif [ "$1" == "install" ]; then
    install $2 
elif [ "$1" == "remove" ]; then
    remove $2
elif [ "$1" == "export" ]; then
    export $2
elif [ "$1" == "open" ]; then
    open $2
else
    echo "Invalid command."
fi
