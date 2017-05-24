filetype plugin indent on
syntax on
set expandtab
set number
"set nohlsearch
set shiftwidth=2
set tabstop=2
set cursorline
set showmatch
set ignorecase
set smartcase

"set foldmethod=indent
"set foldnestmax=3
"set nofoldenable
"set foldlevel=0
"set foldopen-=block

"set relativenumber
"set softtabstop=2

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/syntastic'
Plug 'elmcast/elm-vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.local/share/nvim/plugged/YouCompleteMe', 'do': './install --clang-completer --tern-completer --racer-completer'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align' 
Plug 'unblevable/quick-scope'
call plug#end()

let mapleader = "\<Space>"

"Remap i to h because we are using i as up now
noremap h i

"Remap 
"i=> up 
"j=>left 
"k=>down 
"l=>right
noremap j h
noremap k j
noremap i k

"Remap ctrl+<direction> moves windows
nnoremap <C-k> :wincmd<Space>j<Enter>
nnoremap <C-j> :wincmd<Space>h<Enter> 
nnoremap <C-i> :wincmd<Space>k<Enter>
nnoremap <C-l> :wincmd<Space>l<Enter>

"Remap 
"shift+k=>down 1 paragraph   
"shift+i=>up 1 pargraph    
"shift+j=>back 1 word    
""shift+l=>forward 1 word
noremap <S-k> }
noremap <S-i> {
noremap <S-j> b
noremap <S-l> w

"Remap 
"Leader j=>jump to first character on line
"Leader l=>jump to last character on line
noremap <Leader>j ^
noremap <Leader>l g_

"Vertical split window and focus it
nnoremap <C-c> :vs<Enter><C-w><Right>
"Close all buffers
nnoremap <C-n> :%bd<Enter>
nnoremap !<C-n> :%bd!<Enter>
"Close buffer
nnoremap <expr> <C-d> ( winnr("$") == 2 ? ':bp<bar>sp<bar>bn<bar>bd<Enter>' : ':bd<Enter>')
nnoremap <expr> !<C-d> ( winnr("$") == 2 ? ':bp!<bar>sp!<bar>bn!<bar>bd!<Enter>' : ':bd!<Enter>')
"Quit file
nnoremap <C-q> :q<Enter>
nnoremap !<C-q> :q!<Enter>
"Open terminal tab and focus it
nnoremap <C-t> :vs<Enter><C-w><Right>:term<Enter>
"Switch buffers
nnoremap !<Tab> :buffer!<Space>
nnoremap <Tab> :buffer<Space>
"Save file
nnoremap <C-s> :w<Enter>
inoremap <C-s> <Esc>:w<Enter>
"Searching project
nnoremap <C-p> :Files<Enter>
nnoremap <C-f> :Find<Space>
"Remove highlighting
nnoremap <C-h> :noh<Enter>
"Open all buffers
nnoremap <C-b> :bufdo!vs<Enter>:q<Enter>:source ~/.config/nvim/init. vim<Enter>
"Have all buffers do something
nnoremap b<C-f> :bufdo!<Space>
"Reload vim config
nnoremap <C-\> :source ~/.config/nvim/init.vim<Enter>
"Easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"inoremap <C-i> <C-o>k
"inoremap <C-j> <C-o>h
"inoremap <C-k> <C-o>j
"inoremap <C-l> <C-o>l

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

set termguicolors
colorscheme onedark
"let g:onedark_terminal_italics=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:polyglot_disabled = ['elm']

let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

autocmd vimenter * NERDTreeFind
autocmd bufenter * if &modifiable | NERDTreeFind | wincmd p | endif
autocmd vimenter * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeMinimalUI = 1
let NERDTreeMapOpenSplit = 'h'

let g:syntastic_elm_checkers = ["elm_make"]
"let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'
let g:syntastic_python_checkers = ["pyflakes"]

let g:airline#extensions#tabline#enabled = 1

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

