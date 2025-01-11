function updateall
sudo -v
flatpak update --assumeyes
set -l id (grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
echo $id
if test $id = "fedora";
    sudo dnf update -y
else if test $id = "arch";
    yay -Syu --answerclean n --answerdiff n --answeredit n --answerupgrade y
else
    echo "Couldn't find distro package manager"
end
end
