#
# Ubuntu 18.04 (Bionic Beaver)
#
# Basic packages i usually install.
#
# Adapted from: https://gist.github.com/h4cc/c54d3944cb555f32ffdf25a5fa1f2602

# clone repo to cos-dir, if it doesn't exist, we do not want to overwrite 
gitclone2cos =                                                 \
	if [ ! -d "/home/bischl/cos/$(2)" ]; then \
	  git clone "git@github.com:$(1)/$(2)" "/home/bischl/cos/$(2)"; \
	fi

.PHONY:	update upgrade preparations graphics fonts google_chrome python slack telegram media latex teamviewer sublime java tools enpass rstudio bash-it ssh-key docker


all:
	@echo "Installation of ALL targets"
	make update
	make upgrade
	make preparations
	make tools
	make fonts
	make enpass
	make google_chrome
	make python
	make slack
	make telegram
	make media
	make latex
	make teamviewer
	make sublime
	make java
	make enpass
	make rstudio
	make bash-it
	make R
	make impressive
	make docker
	make bat





update:
	sudo apt update

upgrade:
	sudo apt -y upgrade

preparations:
	make update
	sudo apt -y install software-properties-common build-essential checkinstall wget curl git libssl-dev apt-transport-https ca-certificates libcurl4-openssl-dev libxml2-dev libcairo2-dev libgmp3-dev libproj-dev libcgal-dev libglu1-mesa-dev libx11-dev libgsl-dev libcr-dev mpich mpich-doc libmagick++-dev vpnc 

# apparently needed for bash-it
fonts:
	mkdir -p ~/.fonts
	rm -f ~/.fonts/*
	wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf -O ~/.fonts/Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete.otf
	fc-cache -v

google_chrome:
	rm -f google-chrome-stable_current_amd64.deb
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt -y install libappindicator1 libindicator7
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm -f google-chrome-stable_current_amd64.deb

python:
	make preparations
	sudo apt -y install python3-pip
	sudo apt -y install ipython3
	sudo pip3 install --upgrade pip
	pip3 install --user flake8

slack:
	sudo snap install slack --classic


media:
	sudo snap install spotify
	sudo apt -y install vlc

latex:
	sudo apt -y install pandoc pandoc-citeproc texlive-full dvipng nbibtex


lectures: 
	$(call gitclone2cos,compstat-lmu,lecture_cim1)
	$(call gitclone2cos,compstat-lmu,lecture_i2ml)
	$(call gitclone2cos,compstat-lmu,lecture_cim2)
	$(call gitclone2cos,compstat-lmu,lecture_deeplearning)

java:
	#FIXME: Do I need oracle jdk or is open enough?
	sudo apt -y install default-jre default-jdk

tools:
	sudo apt -y install meld ack tmux autojump git

neovim:
	# install new neovim from PPA
	sudo apt-add-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim
	# clone Vundle and install plugins from the outside
	rm -rf ~/.vim/bundle/Vundle.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim -c 'PluginInstall' -c 'qa!'

enpass:
	echo "deb http://repo.sinew.in/ stable main" | sudo tee -a /etc/apt/sources.list.d/enpass.list
	wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
	make update
	exit
	sudo apt -y install enpass

rstudio:
	rm -f rstudio-xenial-1.1.447-amd64.deb
	wget https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb
	sudo apt -y install libjpeg62
	sudo dpkg -i rstudio-xenial-1.1.447-amd64.deb
	rm -f rstudio-xenial-1.1.447-amd64.deb

R:
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
	sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/'
	sudo apt -y install r-base r-base-dev
	mkdir -p ~/.R/library
	Rscript -e "install.packages(c('devtools'))"
	Rscript -e "library(devtools); install_github(c('rdatsci/rt', 'r-lib/prettycode'))"
	rt init


bash-it:
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	~/.bash_it/install.sh

ssh-key:
	ssh-keygen -t rsa -b 4096
	ssh-add ~/.ssh/id_rsa

links:
	# clone dotfiles if they dont exits, we do not want to overwrite them
	$(call gitclone2cos,berndbischl,dotfiles)
	ln -fs ~/cos/dotfiles/.bashrc ~/.bashrc
	ln -fs ~/cos/dotfiles/.bash_aliases ~/.bash_aliases
	ln -fs ~/cos/dotfiles/.ssh/config ~/.ssh/config
	ln -fs ~/cos/dotfiles/.tmux.conf ~/.tmux.conf
	ln -fs ~/cos/dotfiles/.Renviron ~/.Renviron
	ln -fs ~/cos/dotfiles/.Rprofile ~/.Rprofile
	ln -fs ~/cos/dotfiles/.vimrc ~/.config/nvim/init.vim
	ln -fs ~/cos/dotfiles/.gitconfig ~/.gitconfig
	ln -fs ~/cos/dotfiles/.openml ~/.openml
	ln -fs ~/cos/dotfiles/bin ~/bin
	ln -fs ~/cos/dotfiles/.rt/packages ~/.rt/packages


fzf:
	rm -rf ~/.fzf 
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --all --key-bindings --completion --update-rc --64


# what is this? remove?
bat:
	wget https://github.com/sharkdp/bat/releases/download/v0.6.0/bat_0.6.0_amd64.deb
	sudo dpkg -i bat_0.6.0_amd64.deb
	rm bat_0.6.0_amd64.deb

jupyter:
	sudo apt install jupyter-notebook jupyter-client
	rinstall IRkernel/IRkernel
	Rscript -e "IRkernel::installspec()"



