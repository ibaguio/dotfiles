" van's custom vim configurations
" see: http://dougblack.io/words/a-good-vimrc.html
" see: https://raw.githubusercontent.com/thesheff17/youtube/master/vim/vimrc
runtime ~/.vim/autoload/pathogen.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Shortcuts

" Custom mappings
let mapleader = ","			    " set comma as leader
nnoremap <leader><space> :nohlsearch<cr>

" Disable arrow keys in insert mode. Expert Mode!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

"" General ""
set history=350
set autoread

filetype plugin on			    " load filetype-specific indent files
filetype indent on

" Colors
colorscheme molokai			    " sublime look
syntax enable 					" enable syntax processing
set encoding=utf8
set showcmd

" Spaces & Tabs
set tabstop=4					" number of visual spaces per TAB
set softtabstop=4				" number of spaces in tab when editing
set expandtab	    			" tabs are spaces
set smarttab
set shiftwidth=4
set ai "auto indent"
set si "smart indent"
set wrap "wrap lines"

" UI Config
set ruler
set relativenumber
set ignorecase
set smartcase
set cursorline					" highlight current line
set wildmenu						" visual autocomplete for command menu
set noerrorbells
set lazyredraw					" redraw only when needed

" Folding
set foldenable					" enable folding
set foldlevelstart=10		    " open most folds by default
set foldnestmax=10			    " 10 nested fold max
set foldmethod=indent		    " fold based on indent level, 
nnoremap <space> za			    " open/close folds

" Searching
set hlsearch					" highlight search matches
set incsearch					" search as characters are entered
set showmatch					" highlight matching [{()}]
set mat=2

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

set mouse=a                     " allow scrolling using mouse

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" move to beginning/end of line
nnoremap B ^ 
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

"" Files, backup, undo
set nobackup
set nowb

" Pathogen load
filetype off
filetype plugin on
call pathogen#infect()
call pathogen#helptags()

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10 
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = vnew
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_rope_lookup_project = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus

" load up the nerd tree
autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "left"
" " move to the first buffer
autocmd VimEnter * wincmd p
let NERDTREEIgnore = ['\.pyc$']
" paste toggle
set pastetoggle=<F2>

" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
