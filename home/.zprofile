#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#
# Browser
#
OS=$(uname -s)
case $OS in
  Linux) 
    DISTRO=$(lsb_release -si)
    case $DISTRO in
      Ubuntu) 
        #eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/*_rsa)
        ;;
      *) 
        ;;
    esac
    ;;
  Darwin)
    BROWSER='open'
    ;;
  *) 
    ;;
esac

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath pythonpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi
# Keep virtualenv from modifying the commandline - powerline takes care of that
export VIRTUAL_ENV_DISABLE_PROMPT=1


#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

path_additions=(
    ${HOME}/.local/bin
    /usr/local/bin
    /usr/local/sbin
)

path=(
    $path_additions
    $path
    )

# Env Vars
export VAGRANT_MAX_VM_MEMORY=4096  

source ${HOME}/.zshrc

if [ -f "/home/vagrant/.conda_profile" ]; then
  . "/home/vagrant/.conda_profile"
fi
