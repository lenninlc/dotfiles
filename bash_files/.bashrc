# .bashrc
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	#PATH="$HOME/.local/bin:$HOME/bin:$PATH"
	PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin/:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc
. "$HOME/.cargo/env"
# Banner when the shell starts
echo "$(cat $HOME/.config/banners/keepgoing)"
# Starship customizable prompt
# eval "$(starship init bash)"
eval "$(starship init bash)"
CONFIG_DIR="$HOME/.config/lazygit"
