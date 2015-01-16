set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

 " ==========================================================
 " Bundles
 " ==========================================================

        Plugin 'gmarik/Vundle.vim'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'chriskempson/base16-vim'
        Plugin 'scrooloose/syntastic'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'elzr/vim-json'
        Plugin 'avakhov/vim-yaml'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-surround'
        Plugin 'christoomey/vim-tmux-navigator'
        Plugin 'plasticboy/vim-markdown'
        Plugin 'scrooloose/nerdtree'
        Plugin 'bling/vim-airline'
        Plugin 'nvie/vim-flake8'
 "      Plugin 'klen/python-mode'


" All of your Plugins must be added before the following line
call vundle#end()            " required

 " ==========================================================
 " Basic Settings
 " ==========================================================
 syntax on                     " syntax highlighing
 filetype on                   " try to detect filetypes
 filetype plugin indent on     " enable loading indent file for filetype
 set number                    " Display line numbers
 set title                     " show title in console title bar
 set wildmenu                  " Menu completion in command mode on <Tab>
 set wildmode=full             " <Tab> cycles between all matching choices.

 " ==========================================================
 " Vim-Airline Settings
 " ==========================================================
 set laststatus=2
 set t_Co=256
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#enabled = 1

 " ==========================================================
 " Python-Mode settings
 " ==========================================================
 " folding
 " checkers
 
 " ==========================================================
 " NERDTree (and Tabs)
 " ==========================================================
 let g:nerdtree_tabs_open_on_console_startup = 1
 let g:nerdtree_tabs_smart_startup_focus = 2

 " ==========================================================
 " Editing
 " ==========================================================
 set expandtab
 set autoindent
 set shiftround              " rounds indent to a multiple of shiftwidth
 set textwidth=80            " Lines are automatically wrapped after 80 columns
 set backspace=2             " Make backspace work like it does everywhere else

 " Set the tab width
 let s:tabwidth=2
 exec 'set shiftwidth='.s:tabwidth
 exec 'set softtabstop='.s:tabwidth
 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

 " ==========================================================
 " Aesthetics
 " ==========================================================
 " let base16colorspace=256  " Access colors present in 256 colorspace (Base16)
 colorscheme solarized
 set background=dark
 
 " ==========================================================
 " Navigation
 " ==========================================================
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h

 " ==========================================================
 " Filetype Handling
 " ==========================================================
 " Prevent conflicts between YCM and python-mode (YCM lacks
 " robust python support, at least for what I want)
 "   let g:ycm_filetype_blacklist = {
 "                                  \ 'python' : 1
 "                                  \}

 " Allow OSX editing of crontab using vim
 autocmd filetype crontab setlocal nobackup nowritebackup
