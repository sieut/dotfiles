" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Easy align
Plug 'junegunn/vim-easy-align'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" Rust
Plug 'rust-lang/rust.vim'

" Auto mkdir
Plug 'travisjeffery/vim-auto-mkdir'

" Autocomplete
Plug 'https://github.com/Valloric/YouCompleteMe.git'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Auto brackets
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" Git Gutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

" Move, Rename file
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" Vim dispatch
Plug 'tpope/vim-dispatch'

" Vim fugitive
Plug 'tpope/vim-fugitive'

" Vim commentary
Plug 'tpope/vim-commentary'

" TagBar
Plug 'majutsushi/tagbar'
nmap <silent> <F2> :TagbarToggle<CR>

" Indexed Search
Plug 'henrik/vim-indexed-search'

" Easy Motion
Plug 'easymotion/vim-easymotion'

" UltiSnips
Plug 'SirVer/ultisnips'
inoremap <C-q> <C-R>=UltiSnips#ExpandSnippet()<CR>

" NERDtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeWinPos = "left"
map <leader>nn :NERDTreeToggle<cr>

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Ack
Plug 'mileszs/ack.vim'
let g:ack_use_dispatch=1
let g:ack_use_cword_for_empty_search = 0
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
map <leader>g :Ack

" Command-T
Plug 'wincent/command-t'
let g:commandTFileScanner='git'

" BufExplorer
Plug 'corntrace/bufexplorer'
map <leader>o :BufExplorer<cr>

" Syntastic
Plug 'scrooloose/syntastic'

" Lightline
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" Initialize plugin system
call plug#end()

" Leader to ,
let mapleader=","

" ===== Search settings ==== "
" Smart case
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" For regular expressions turn magic on
set magic

" ==== Status line ==== "
" Always show the status line
set laststatus=2
" Wildmenu for cmdline completion
set wildmenu

" ==== Turn persistent undo on ==== "
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Relative line number
set rnu
" Autoread if file is changed outside of Vim
set autoread
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"Always show current position
set ruler
" Set tags file
set tags=tags;
" Show cmd
set showcmd
" Better linebreak
set showbreak=↪
" Keep visually selected block after indenting
vnoremap > >gv
vnoremap <lt> <lt>gv

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" <leader>; to insert ; at end of line
nnoremap <leader>; A;<Esc>

" Timeout for meta combinations
set timeout ttimeoutlen=50

" CTRL-h and CTRL-l to start and end line
noremap <C-l> $
noremap <C-h> ^

" CTRL-k and CTRL-j to move up/down by a page
noremap <C-k> Hzz
noremap <C-j> Lzz

" ; to :
noremap ; :

" Map leader-wo to window only
noremap <leader>wo <C-w>o

" No newline at EOF
set binary
set noeol

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set list
set diffopt+=vertical
set listchars=tab:>-

" Map :W to :w, so fucking annoying
command! W w
" Same with :Q
command Q q

" Tags file config for Rust
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Colorscheme
set t_Co=16
let g:solarized_termcolors=16
set background=light
colorscheme solarized