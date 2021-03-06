"just in case
set shell=/bin/bash

"vundle shit
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Plugin 'gmarik/vundle'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'ludovicchabant/vim-lawrencium'
"Plugin 'Valloric/YouCompleteMe',
"Plugin 'mbbill/undotree'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'solarnz/thrift.vim'
"Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'majutsushi/tagbar'
"Plugin 'tpope/vim-commentary'
"Plugin 'Raimondi/delimitMate'
"Plugin 'wincent/Command-T'
"Plugin 'terryma/vim-expand-region'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"Plugin 'xolox/vim-session'
Plugin 'tmux-plugins/vim-tmux'
"Plugin 'reidHoruff/tagless'
"Plugin 'reidhoruff/HiCursorWords'
Plugin 'reidhoruff/a.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'joshdick/onedark.vim'
"Plugin 'vim-scripts/Conque-GDB'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'tpope/vim-dispatch'
"Plugin 'wincent/terminus'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'sudar/vim-arduino-syntax'
Plugin 'will133/vim-dirdiff'


call vundle#end()
filetype plugin indent on

let mapleader = "\<Space>"

set updatetime=200

"bookmarks stuff
"let g:bookmark_no_default_key_mappings = 1
"let g:bookmark_auto_save = 1
"let g:bookmark_manage_per_buffer = 1
"let g:bookmark_auto_close = 1
"let g:bookmark_sign = '~'
"let g:bookmark_highlight_lines = 0
"map mm :BookmarkToggle<CR>
"map mn :BookmarkNext<CR>
"map gj :BookmarkShowAll<CR>

"nerd tree stuff
"let g:NERDTreeWinSize = 35

"highlight current word after 300ms
let g:HiCursorWords_delay = 300

"always show status bar
set laststatus=2
"always show col/line num in status bar
set ruler
set linebreak

"command t stuff
"let g:CommandTMaxFiles=350000
"let g:CommandTFileScanner = 'watchman'
"let g:CommandTInputDebounce = 200
"let g:CommandTMaxHeight = 20
"let g:CommandTSmartCase = 1

"pane navigation
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>

"disable arrow keys
noremap <Up> ""
noremap! <Up> <Esc>
noremap <Down> ""
noremap! <Down> <Esc>
noremap <Left> "
noremap! <Left> <Esc>
noremap <Right> ""
noremap! <Right> <Esc>

"some useful shortcuts
"map <C-f> :CtrlPBuffer<CR>
map <C-f> q:i
map <leader>s :w<CR>
map <leader>a :A<CR>
map <leader>e :IH<CR>
map <leader>n :cn<CR>zz
map <leader>p :cp<CR>zz
map <C-)> :cn<CR>zz
map <C-(> :cn<CR>zz
map <leader>d :Gvdiff<CR>
map <Leader>u :.,$s/\<<C-r><C-w>\>/
map <Leader>m :make comp_color=never compiler=clang++\|copen<CR>
"map qq :q!<CR>
map G Gzz
map gU gUiw
map gu guiw
map <leader>r :%s/\<<C-r><C-w>\>/
map * <C-]>zz
map ( :tp<CR>
map ) :tn<CR>
map K <Plug>(expand_region_expand)
map <leader>r :so ~/.vimrc<CR>
map <leader>q :wq<CR>

" fuzzy file opener... there are many
"map <C-f> :CtrlPBuffer<CR>
map go :CtrlP<CR>
" map go :FBVimMuralSearch<CR>
" map go :CommandT<CR>

"allows hidden bufers (dont have to save before hiding)
set hidden

"ignore search/replace case
set ignorecase
set smartcase
set hlsearch
set incsearch

"all things relating to tabs
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent

"ctrl+p stuff
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:15'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'O'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|o|hcg|dil|out|obj|d|mk|opt|gcda|gcno)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }

"easymotion activated via space
"map <SPACE> <Plug>(easymotion-s2)

"fuck swap files
set noswapfile

"allow use of mouse
set mouse=a
set modifiable
"double clicking on word will highlight all instances
map <2-LeftMouse> gd
"when highlighting all instance of current word under cursor
"make sure cursor stays in pos
map gd gd``
"mouse escape codes or some shit
set ttymouse=sgr

"you complete me stuff
let g:ycm_min_num_identifier_candidate_chars = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_specific_completion_to_disable = {'php':1, 'javascript':1, 'python':1}

"makes shifting easier
noremap < <<
noremap > >>

"remember cursor position
set nosol

" [FB-ONLY]
" Can't set SELinux security context on nfs, which FB homedirs use, so
" override the default location
let undo_base_dir = $HOME . '/local/.vim/'
for directory in ["backup", "swap", "undo"]
  silent! call mkdir(undo_base_dir . directory, "p")
endfor
let &backupdir = undo_base_dir . '/backup//'
let &directory = undo_base_dir . '/swap//'
let &undodir = undo_base_dir . '/undo//'
" Keep undo history across sessions, by storing in file. This never works
set undofile

"use system clipboard as default reg. only works locally
set clipboard=unnamed

"start scrolling 8 lines from top/bottom of pane
set scrolloff=8

"kill search
nnoremap // :noh<CR>

au BufReadPost TARGETS set syntax=python
au BufReadPost BUILD set syntax=python
au BufReadPost SConstruct set syntax=python
au BufReadPost *.BUILD set syntax=python
au BufReadPost WORKSPACE set syntax=python
au BufReadPost *.cconf set syntax=python
au BufReadPost *.in set syntax=cpp
au BufReadPost cgdbrc set filetype=vim
au BufReadPost *.tw set filetype=python
au BufReadPost *.fbpkg.cconf set filetype=python

let g:tagless_context_lines=7
let g:tagless_highlight_result=1
let g:tagless_window_height=30
let g:tagless_enable_shitty_syntax_highlighting=1
let g:tagless_infer_file_types=1
map <leader>f :TaglessCW<CR>
map <leader>l :Lines<CR>
"map <leader>o :FZF<CR>
map <leader>o :CtrlPDir<CR>
map <leader>t :Tags<CR>
map <leader>b :Buffers<CR>

let g:fzf_layout = {'down': '~40%' }

"remember cursor positions
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" remember scroll pos when switching between buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" recursively find tags files
set tags=tags;/
set autoread

"
" THEME
"
syntax enable
set number
set relativenumber
set t_Co=256

let python_highlight_all = 1

if 1
  let c_gnu = 1
  let bg = 234
  set background=dark

  "hi Normal ctermfg=015  ctermbg=000 cterm=None
  hi Todo ctermfg=black ctermbg=251 cterm=None
  hi String ctermfg=186 ctermbg=None cterm=None
  "hi Cursor ctermfg=red ctermbg=None cterm=None
  hi SpecialKey ctermfg=87 ctermbg=None cterm=None
  hi Directory ctermfg=76 ctermbg=None cterm=None
  hi ErrorMsg ctermfg=253 ctermbg=124 cterm=None
  hi PreProc ctermfg=246 ctermbg=None cterm=None
  hi Type ctermfg=75 ctermbg=None cterm=None
  hi StorageClass ctermfg=75 ctermbg=None cterm=None
  hi Structure ctermfg=75 ctermbg=None cterm=None
  hi Typedef ctermfg=75 ctermbg=None cterm=None
  hi Comment ctermfg=243 ctermbg=None cterm=None
  hi Identifier ctermfg=75 ctermbg=None cterm=None
  hi Function ctermfg=75 ctermbg=None cterm=None
  hi DiffText ctermfg=88 ctermbg=250 cterm=None
  hi Constant ctermfg=208 ctermbg=None cterm=None
  hi Search ctermfg=black ctermbg=220 cterm=None
  hi Error ctermfg=196 ctermbg=None cterm=None
  hi Special ctermfg=160 ctermbg=None cterm=None
  hi Operator ctermfg=red ctermbg=None cterm=None
  hi Ignore ctermfg=220 ctermbg=None cterm=None
  hi Underline ctermfg=244 ctermbg=None cterm=None
  hi Visual cterm=none ctermbg=020 ctermfg=None
  hi MatchParen cterm=none ctermbg=46 ctermfg=black

  hi Conditional cterm=None ctermfg=red ctermbg=None
  hi Statement cterm=None ctermfg=red ctermbg=None
  hi Repeat cterm=None ctermfg=red ctermbg=None

  hi FoldColumn ctermfg=248 ctermbg=None cterm=None
  hi Folded ctermfg=248 ctermbg=None cterm=None
  "hi StatusLine ctermbg=022 ctermfg=255 cterm=None
  "hi StatusLineNC ctermbg=022 ctermfg=254 cterm=None
  hi VertSplit ctermfg=000 ctermbg=022 cterm=None

  hi LineNr ctermfg=250 ctermbg=000 cterm=None
  hi CursorLineNr ctermfg=white ctermbg=000 cterm=None
  hi NonText ctermfg=87 ctermbg=None cterm=None

  hi Pmenu ctermfg=White ctermbg=black cterm=None
  hi PmenuSel ctermfg=black ctermbg=Gray cterm=None
  hi PmenuSbar ctermfg=DarkGray ctermbg=DarkGray cterm=None
  hi PmenuThumb ctermfg=Gray ctermbg=Gray cterm=None

  "set cursorline
  "hi CursorLine cterm=NONE ctermbg=NONE

  hi DiffAdd    cterm=bold ctermfg=black ctermbg=41 gui=none guifg=bg guibg=Red
  hi DiffDelete cterm=bold ctermfg=black ctermbg=161 gui=none guifg=bg guibg=Red
  hi DiffChange cterm=bold ctermfg=black ctermbg=32 gui=none guifg=bg guibg=Red
  hi DiffText   cterm=bold ctermfg=255 ctermbg=27 gui=none guifg=bg guibg=Red
  "hi CursorLine   cterm=NONE ctermfg=None ctermbg=18
endif
"
" END THEME
"


augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
