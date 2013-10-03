" Setting up vundle - if not installed before
let vundle_installed = 1
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""

	" Fetch vundle and install
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let vundle_installed = 0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundles
Bundle 'gmarik/vundle'
Bundle 'Syntastic'

" Run automatically if vundle was not installed before
if vundle_installed == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif

" Syntastic - Customize the bundle
let g:syntastic_php_phpcs_args = '--report=csv --standard=PSR2 --encoding=utf-8'

" Syntax highlighting is turned on
syn on

" Sets how many columns a tab spans
set tabstop=4

" Sets how many columns to use on indention
set shiftwidth=4
set nocompatible

" Keeps the same indentation on the next line
set autoindent
set cindent

" Show the ruler
set ruler

" Show the line numbers
set number
set smarttab

" Search - ignore case on search and additional searching
set ignorecase
set smartcase

" Center the screen vertically around the cursor
set so=999

let php_htmlInStrings = 1

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Switch syntax highlighting on, when the terminal has colors - also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
