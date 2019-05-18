" Necesary for lots of cool vim things
set nocompatible

set t_Co=256
syntax on

" Auto reload vimrc file
augroup reload_vimrc " {
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
	"autocmd!
	""autocmd BufWritePost $MYVIMRC source $MYVIMR
	"autocmd! bufwritepost .vimrc source %
augroup END " }

autocmd! bufwritepost .vimrc source %

" use for commenter
filetype plugin on

" Line numbers
set number
set numberwidth=5

" Highlight current line
set cul

" Search
set incsearch
set hlsearch
set ignorecase smartcase

" Menu for command line completion
set wildmenu
set wildmode=longest:list,full

" Add color to the 80th column
set colorcolumn=80

" Scrolling
set scrolloff=4

" Add list chars for invisible characters
if has('gui_running')
	set list listchars=tab:▶‒,eol:¬,nbsp:∙,trail:∙,extends:▶,precedes:◀
	let &showbreak = '↳'
else
	set list listchars=tab:>-,eol:¬,nbsp:+,trail:.,extends:>,precedes:<
	let &showbreak = '^'
endif

"Plugins
if !filereadable(expand('~/.vim/autoload/plug.vim'))
	silent !mkdir -p ~/.vim/{autoload,undo,backups}
	silent !curl -fLo ~/.vim/autoload/plug.vim
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'fatih/vim-go'
" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'nsf/gocode'

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'majutsushi/tagbar'

Plug 'vim-airline/vim-airline' |  Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'ctrlpvim/ctrlp.vim'

" comment lines
Plug 'scrooloose/nerdcommenter'

Plug 'vim-syntastic/syntastic'

" comment lines
Plug 'scrooloose/nerdcommenter'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'tomasr/molokai' | Plug 'fmoralesc/molokayo'

call plug#end()

let g:ctrlp_show_hidden = 1

colorscheme molokayo

nmap <silent> <F8> :TagbarToggle<CR>

nmap <silent> <F5> :setlocal spell! spelllang=en_us<CR>

nmap <silent> <C-\> :NERDTreeToggle<CR>


