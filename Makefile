all: env git aerospace nvim wal zsh tmux iterm python

# Make variables.
CONFIG:= ${HOME}/.env/config

env:
	@chown -R $(id -u):$(id -g) ${PWD};
	rm -rf ${HOME}/.profile 										                \
			${HOME}/.bashrc											                    \
			${HOME}/.bash_logout									                  \
			${HOME}/.bash_profile									                  \
		2> /dev/null;												                      \
	ln -s ${CONFIG}/profile				${HOME}/.profile;			        \
	ln -s ${CONFIG}/bash/bashrc			${HOME}/.bashrc;			      \
	ln -s ${CONFIG}/bash/bash_logout	${HOME}/.bash_logout;		  \
	ln -s ${CONFIG}/bash/bash_profile	${HOME}/.bash_profile;		\


git:
	@rm -f ${HOME}/.gitconfig ${HOME}/.gitignore				    \
		2> /dev/null;												                  \
	ln -s ${CONFIG}/git/gitconfig		${HOME}/.gitconfig
	ln -s ${CONFIG}/git/gitignore       ${HOME}/.gitignore

aerospace:
	@ln -s ${CONFIG}/aerospace/ ${HOME}/.config/

nvim:
	@ln -s ${CONFIG}/nvim/ ${HOME}/.config/

wal:
	@ln -s ${CONFIG}/wal/templates ${HOME}/.config/wal/templates

zsh:
	@ln -s ${CONFIG}/zsh/zshrc ${HOME}/.zshrc

tmux:
	@ln -s ${CONFIG}/tmux/tmuxconf ${HOME}/.tmux.conf

iterm:
	@ln -s ${CONFIG}/scripts/iterm2-spawn-window.py ${HOME}/Library/Application\ Support/iTerm2/Scripts/AutoLaunch

python:
	@ln -s ${CONFIG}/pycodestyle ${HOME}/config/pycodestyle
