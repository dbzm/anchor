#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
GARDEN=$(homesick show_path anchor)/garden
GARDEN=${GARDEN:-$HOME}
if [[ -s "${GARDEN}/.zprezto/init.zsh" ]]; then
  source "${GARDEN}/.zprezto/init.zsh"
fi

if [[ -s "${GARDEN}/.powerline" ]]; then
  export PWR_BINDINGS=${GARDEN}/.powerline/bindings
  POWERLINE=${PWR_BINDINGS}/zsh/powerline.zsh
fi

# source completions
if [[ -d "${GARDEN}/completions" ]]; then
    for completion in $(ls "${GARDEN}/completions" 2> /dev/null); do
        source "${GARDEN}/completions/${completion}"
    done
fi



export B16SCHEME=monokai
export B16BKGRND=dark
BASE16=${BASE16DIR:-$HOME}/.config/base16-shell/base16-${B16SCHEME:-monokai}.${B16BKGRND:-dark}.sh
[[ -s ${BASE16} ]] && source ${BASE16}

# Base16 Shell
#  export BASE16_SCHEME="tomorrow" # This may also be used by .vimrc
#  BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
#  [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
#

 
#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

    alias cp='cp -iv'                           # Preferred 'cp' implementation
    alias mv='mv -iv'                           # Preferred 'mv' implementation
    alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
    alias rm='rm -v'				# Preferred 'rm' implementation
    alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
    alias ct='tail -n +1 | less'                # List multiple files with file names as headers
    cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
    alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
    alias ..='cd ../'                           # Go back 1 directory level
    alias ...='cd ../../'                       # Go back 2 directory levels
    alias .2='cd ../../'                        # Go back 2 directory levels
    alias .3='cd ../../../'                     # Go back 3 directory levels
    alias .4='cd ../../../../'                  # Go back 4 directory levels
    alias .5='cd ../../../../../'               # Go back 5 directory levels
    alias .6='cd ../../../../../../'            # Go back 6 directory levels
    alias edit='vim'                            # edit:         Opens any file in vim editor
    alias ~="cd ~"                              # ~:            Go Home
    alias which='whence -asv'                   # which:        Find executables
    alias mypath='echo -e ${PATH//:/\\n}'       # path:         Echo all executable Paths
    alias tmux='tmux -2'                        # tmux:         Open tmux in 256-color mode
    mcdir () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
    mpydir () {mcdir "$1" && touch "__init__.py"}


#   ---------------------------
#   3.  OTHER ALIASES
#   ---------------------------

    #  3.1:     Docker
    alias dce='docker-compose exec'             # docker-compose: Exec mode
    alias dcli='docker-compose exec django python django/manage.py'
    alias dosypr='docker system prune --volumes -f'

    alias dk-running='docker kill $(docker ps -q)' # Kill running containers

    alias avtest='docker-compose exec django pytest'

    # 3.2:      Git
    alias gc-ane='git commit --amend --no-edit'
    alias gp-refresh='git pull --all --tags --prune'

    alias be='bundle exec '
    alias oal='onelogin-aws-login --profile=default'

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

    alias qfind="find . -name "                 # qfind:    Quickly search for file
    ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
    ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
    ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   ---------------------------------------
#   6.  Mac Functionality
#   ---------------------------------------

    if [[ "$OSTYPE" == darwin* ]]; then

        POWERLINE="/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

        alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
        trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
        ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

        #   Use MacOS spotlight metatdata to search
        spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

        #   finderShowHidden:   Show hidden files in Finder
        #   finderHideHidden:   Hide hidden files in Finder
        alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
        alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
    fi

#   ---------------------------------------
#   7.  Git functionality
#   ---------------------------------------

    alias gitflake='flake8 `git status --porcelain | sed "s/^...//" | grep ".*.py"`'
    alias gbs='git for-each-ref --sort=committerdate refs/heads/ \
      --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'


source $POWERLINE
