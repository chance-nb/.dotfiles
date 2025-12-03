function updateall
    sudo -v
    set -l id (grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
    if test $id = "fedora";
        sudo dnf update --assumeyes
    else if test $id = "arch";
        yay -Syu --answerclean n --answerdiff n --answeredit n --answerupgrade y
    else if command -q apt;
        sudo apt update
        sudo apt upgrade
    else
        echo "Couldn't find distro package manager"
    end

    if command -q flatpak;
        flatpak update --assumeyes
    end
end
