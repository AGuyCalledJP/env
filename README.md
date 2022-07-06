# Machine Config #

## Using This Repository ##
To use this repo:
* Clone it to your home directory
* Hide the directory (`mv ${HOME}/env ${HOME}/.env`)
* Run `make <desired-image>`.
** Be aware that this will replace your existing `.profile`, `.bashrc`, `.screenrc`, `.vimrc`, and `.vim` directory, as well as variables such as `$SCRIPTS` and `$FUNCTIONS`, if they exist already. Run `source ~/.profile` to load the new environment.

## Directory Structure ##
This repository and its installation scripts add three directories to ${PATH}:
* `~/.env/config` (`$CONFIG`) - Config files and runcommands for Bash, GNU screen, Vim, etc.
* `~/.env/functions` (`$FUNCTIONS`) - Contains custom Bash functions. Consumed by bashrc.
* `~/.env/scripts` (`$SCRIPTS`) - Contains all scripts (Python3 and Bash) to be consumed by the shell. Exists in `$PATH`.)

## File Structure ##
As previously noted, running `make all` will:
* Replace the user's profile, bash, vim, git, psql, and GNU screen run commands.
* Sets default configs for GNUpg, SSH, etc.
* `.bashrc` also loads `~/.env/aliases`, `~/.env/vars.sh`, and `~/.env/functions/*`, which set user aliases, environment variables, and bash functions respectively.
`make manjaro` will:
* Load my desired configurations for a manjaro image. To fully leverage i3, you need to install that first, log back in using i3, then clone and install the repo
