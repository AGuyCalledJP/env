all: env git gpg psql python ssh vim

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
	@rm -f ${HOME}/.gitconfig										\
		2> /dev/null;												\
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig


python:
	@python -m ensurepip --upgrade &&								\
		pip install --user -r ${CONFIG}/python/requirements.txt


vim:
	@mv ${HOME}/.vimrc ${HOME}/.vimrc.bkp 							\
		2> /dev/null;												\
	mv ${HOME}/.vim ${HOME}/.vim.bkp								\
		2> /dev/null;												\
	ln -s ${CONFIG}/vim					${HOME}/.vim;				\
	ln -s ${CONFIG}/vim/vimrc			${HOME}/.vimrc


vscode:
	@mv ${HOME}/.config/Code/User/keybindings.json                  \
		${HOME}/.config/Code/User/keybindings.bkp                   \
		2> /dev/null;												\
	ln -s ${CONFIG}/vscode/keybindings.json                         \
		${HOME}/.config/Code/User/keybindings.json
