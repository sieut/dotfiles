set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Easy align
Plug 'junegunn/vim-easy-align'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" JSX syntac
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Typescript syntax
Plug 'HerringtonDarkholme/yats.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-d>'
let g:multi_cursor_prev_key = '<C-s>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<ESC>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" Auto mkdir
Plug 'travisjeffery/vim-auto-mkdir'

" Autocomplete
Plug 'https://github.com/Valloric/YouCompleteMe.git'

" Auto brackets
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Move, Rename file
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" Vimwiki
Plug 'vimwiki/vimwiki'

" TagBar
Plug 'majutsushi/tagbar'
nmap <silent> <F2> :TagbarToggle<CR>

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" NERDtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()

" Relative line number
set rnu
" Autoread if file is changed outside of Vim
set autoread
" Set tags file
set tags=tags;
" Git gutter config
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1
" Keep visually selected block after indenting
vnoremap > >gv
vnoremap <lt> <lt>gv

" Hardcore habit breaking
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Up and Down in insert won't work because YouCompleteMe
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Delete trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Enter to insert newline in normal mode
noremap <CR> o<Esc>

" <leader>; to insert ; at end of line
nnoremap <leader>; A;<Esc>

" Timeout for meta combinations
set timeout ttimeoutlen=50

" CTRL-h and CTRL-l to start and end line
noremap <C-l> $
noremap <C-h> ^

" CTRL-k and CTRL-j to move up/down by 40 lines
noremap <C-k> 40k
noremap <C-j> 40j

" Map leader-space to insert space in normal mode
nnoremap <leader><Space> i<Space><Esc>

" 256 color schemes
set term=screen-256color

" Movement like w but ignore punctuations
" Map it to W
function! JumpToNextWord()
    normal w
    while strpart(getline('.'), col('.')-1, 1) !~ '\w'
        normal w
    endwhile
endfunction
noremap <silent> <S-w> :call JumpToNextWord()<CR>

" No newline at EOF
set binary
set noeol

" Map :W to :w, so fucking annoying
command! W w
" Same with :Q
command Q q

" Set .tsx filetype to be javascript
au BufRead,BufNewFile *.tsx set filetype=typescript
