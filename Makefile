all: env git vim alacritty i3 polybar wal-polybar
osx: nvim git yabai skhd

# Make variables.
CONFIG:= ${HOME}/.env/config

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
	@rm -f ${HOME}/.gitconfig ${HOME}/.gitignore				    \
		2> /dev/null;												\
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig
	ln -s ${CONFIG}/git/gitignore       ${HOME}/.gitignore

nvim:
	@ln -s ${CONFIG}/nvim/ ${HOME}/.config/


alacritty:
	@rm -rf ${HOME}/.config/alacritty                               \
		2> /dev/null;												\
	ln -s ${CONFIG}/alacritty/ ${HOME}/.config/

i3:
	@rm -rf ${HOME}/.config/i3/config                               \ 
		2> /dev/null;												\
	ln -s ${CONFIG}/i3/config ${HOME}/.config/i3/config		        \


polybar:
	@rm -rf ${HOME}/.config/polybar/                                \
		2> /dev/null;												\
	ln -s ${CONFIG}/polybar/ ${HOME}/.config/


wal-polybar:
	@rm -rf /usr/bin/wal-polybar;
	ln -s ${CONFIG}/polybar/wal-polybar.py  /usr/bin/wal-polybar;
	wal-polybar


xmodmap:
	@rm -rf ${HOME}/.xmodmaprc                                      \ 
		2> /dev/null;												\
	ln -s ${CONFIG}/xmodmap/xmodmaprc ${HOME}/.xmodmaprc		    \

picom:
	@ln -s ${CONFIG}/picom/ ${HOME}/.config/
