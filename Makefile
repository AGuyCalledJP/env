all: env git vim alacritty i3 polybar wal-polybar
manjaro: env git vim alacritty i3 python auracle-git pacaur chrome

# Make variables.
CONFIG:= "${HOME}/.env/config"

env:
	@chown -R $(id -u):$(id -g) ${PWD};
	rm -rf ${HOME}/.profile 										\
			${HOME}/.bashrc											\
			${HOME}/.bash_logout									\
			${HOME}/.bash_profile									\
		2> /dev/null;												\
	ln -s ${CONFIG}/profile				${HOME}/.profile;			\
	ln -s ${CONFIG}/bash/bashrc			${HOME}/.bashrc;			\
	ln -s ${CONFIG}/bash/bash_logout	${HOME}/.bash_logout;		\
	ln -s ${CONFIG}/bash/bash_profile	${HOME}/.bash_profile;		\


git:
	@rm -f ${HOME}/.gitconfig ${HOME}/.gitignore						\
		2> /dev/null;												\
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig
	ln -s ${CONFIG}/git/gitignore       ${HOME}/.gitignore


vim:
	@mv ${HOME}/.vimrc ${HOME}/.vimrc.bkp 							\
		2> /dev/null;												\
	mv ${HOME}/.vim ${HOME}/.vim.bkp								\
		2> /dev/null;												\
	ln -s ${CONFIG}/vim					${HOME}/.vim;				\
	ln -s ${CONFIG}/vim/vimrc			${HOME}/.vimrc


alacritty:
	@rm -rf ${HOME}/.config/alacritty                                \
		2> /dev/null;												\
	mkdir ${HOME}/.config/alacritty;
	ln -s ${CONFIG}/alacritty/alacritty.yml 					    \
		${HOME}/.config/alacritty/alacritty.yml


i3:
	@rm -rf ${HOME}/.config/i3/config                               \ 
		2> /dev/null;												\
	ln -s ${CONFIG}/i3/config ${HOME}/.config/i3/config		        \


i3status:
	@rm -rf ${HOME}/.config/i3status/config                         \
		2> /dev/null;												\
	ln -s ${CONFIG}/i3status/config ${HOME}/.config/i3status/config


polybar:
	@rm -rf ${HOME}/.config/polybar/config.ini                      \
		2> /dev/null;												\
	ln -s ${CONFIG}/polybar/config ${HOME}/.config/polybar/config


wal-polybar:
	@rm -rf /usr/bin/wal-polybar;
	ln -s ${CONFIG}/polybar/wal-polybar.py  /usr/bin/wal-polybar;
	wal-polybar


xmodmap:
	@rm -rf ${HOME}/.xmodmaprc                                      \ 
		2> /dev/null;												\
	ln -s ${CONFIG}/xmodmap/xmodmaprc ${HOME}/.xmodmaprc		    \


python:
	@python -m ensurepip --upgrade &&								\
		pip install --user -r ${CONFIG}/python/requirements.txt


auracle-git:
	@cd ${HOME} &&                                                  \
	git clone https://aur.archlinux.org/auracle-git.git &&          \
	cd auracle-git &&                                               \
	makepkg -si &&                                                  \
	cd .. && rm -rf auracle-git


#Chome drivers and this works but doesnt exit successfully
pacaur:
	@cd ${HOME} &&                                                  \
	sudo pacman --noconfirm -Syu jq pipewire-jack &&                \
	git clone https://aur.archlinux.org/pacaur.git &&               \
	cd pacaur &&                                                    \
	makepkg -si &&                                                  \
	pacaur --noconfirm -Syyuu &&                                    \
	cd .. && rm -rf pacaur


chrome:
	@pacaur --noconfirm -Syu google-chrome
