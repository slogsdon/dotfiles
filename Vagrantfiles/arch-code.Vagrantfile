# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "denis/archlinux64"
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  config.vm.provision :shell, inline: <<-SHELL
    # install base development tools
    sudo pacman -S --needed base-devel
    mkdir ~/builds
    cd ~/builds
    # install package-query for yaourt
    curl -L -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
    tar xfz package-query.tar.gz
    cd ~/builds/package-query
    sudo makepkg -si
    # install yaourt
    cd ~/builds
    curl -L -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
    tar xfz yaourt.tar.gz
    cd ~/builds/yaourt
    sudo makepkg -si
    cd ~
    
    # install packages
    sudo pacman -S \
        git \
        svn \
        bzr \
        mercurial \
        \
        ctags \
        \
        php \
        ruby \
        python \
        jre8-openjdk-headless \
        ghc cabal-install \
        go \
        erlang

    sudo yaourt -S \
        elixir

    # pull down dotfiles
    git clone --recursive https://github.com/slogsdon/dotfiles.git .dotfiles

    # set shell to zsh
     sudo chsh -s `which zsh` vagrant

  SHELL
end
