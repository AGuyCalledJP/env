all: env git vim alacritty i3 python

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
	@sudo pacman -Syu git;
	rm -f ${HOME}/.gitconfig										\
		2> /dev/null;												\
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig


vim:
	@sudo pacman -Syu vim;
	mv ${HOME}/.vimrc ${HOME}/.vimrc.bkp 							\
		2> /dev/null;												\
	mv ${HOME}/.vim ${HOME}/.vim.bkp								\
		2> /dev/null;												\
	ln -s ${CONFIG}/vim					${HOME}/.vim;				\
	ln -s ${CONFIG}/vim/vimrc			${HOME}/.vimrc

alacritty:
	@sudo pacman -Syu alacritty;
	rm -rf ${HOME}/.config/alacritty                                \
		2> /dev/null;												\
	mkdir ${HOME}/.config/alacritty;
	ln -s ${CONFIG}/alacritty/alacritty.yml 					    \
		${HOME}/.config/alacritty/alacritty.yml


i3:
	@rm -rf ${HOME}/.config/i3/config                               \ 
		2> /dev/null;												\
	ln -s ${CONFIG}/i3/config ${HOME}/.config/i3/config;		    \


python:
	@python -m ensurepip --upgrade &&								\
		pip install --user -r ${CONFIG}/python/requirements.txt

