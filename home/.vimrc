set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

 " ==========================================================
 " Bundles
 " ==========================================================

        Bundle 'gmarik/Vundle.vim'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'chriskempson/base16-vim'
        Bundle 'scrooloose/syntastic'
        Bundle 'Valloric/YouCompleteMe'
        Bundle 'elzr/vim-json'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-surround'
        Bundle 'christoomey/vim-tmux-navigator'
        Bundle 'plasticboy/vim-markdown'
        Bundle 'scrooloose/nerdtree'
        Bundle 'bling/vim-airline'
 "      Bundle 'klen/python-mode'


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
 set softtabstop=2
 set shiftwidth=2
 set autoindent
 set expandtab
 set shiftround              " rounds indent to a multiple of shiftwidth
 set textwidth=80            " Lines are automatically wrapped after 80 columns
 set backspace=2             " Make backspace work like it does everywhere else


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
