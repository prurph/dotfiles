" *** init.vim

" *** Plugins
" vim-plug lives in ~/.config/nvim/autoload/plug.vim
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
  Plug 'chriskempson/base16-vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  Plug 'chrisbra/csv.vim'
call plug#end()

" Plugin Settings
" haya14busa/incsearch.vim for automatic removal of search highlighting
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
" g* and g# find matches of word under current cursor even when part of a larger word
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" romgrk/barbar.nvim
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-q> :BufferClose<CR>

" chrisbra/csv.vim
augroup filetype_csv
  autocmd!
  autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
  autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" simnalamburt/vim-mundo
nnoremap <leader>u :MundoToggle<CR>

set termguicolors
let g:airline_theme='base16_shell'
let g:airline_powerline_fonts=1
colorscheme base16-ocean

" *** Options
" Managing options
" :set no<option>        Unset option

" :set <otpion>!         Toggle option
" :set <option>?         Get value
" :set <option>=<value>  Set value
" :set <option>+=<value> Add value (number) or append value (string)
set mouse=a
set noerrorbells
set updatetime=50

" Avoid 'No write since last change when moving between buffers'
set confirm
set hidden

set nobackup
set noshowmode
set noswapfile
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" Indentation
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2 softtabstop=2
set colorcolumn=80
highlight ColorColumn ctermbg=0

" Mode shapes, cursor highlight, blinking
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
set cursorline

" Line numbering
set number relativenumber
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set incsearch
set smartcase
set wildignorecase

syntax enable
syntax on

filetype on
filetype indent on
filetype plugin on

" *** Keybinds
nnoremap <space> <nop>
let mapleader = " "

" Registers
" Use system clipboard, on Linux:
"   + is clipboard (ctrl-c/v in apps, ctrl+option+c/v in Urxvt)
"   * is primary   (middle mouse)
" I use leader y/p and clipboard so I can ctrl+[option+]c/v everywhere
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
" Don't overwrite clipboard when replacing in VISUAL
nnoremap <leader>p "+p
" Deletes don't overwrite register, except dd
" TODO: find a better key for this. S would be good but vim-sneak uses it.
nnoremap d "_d
nnoremap D "_D
vnoremap D "_D
" Leave dd as it is
nnoremap dd dd

" Movement
" Move by wrapped lines unless count provided
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> 0 (v:count == 0 ? 'g0' : '0')
nnoremap <silent> <expr> $ (v:count == 0 ? 'g$' : '$')
" Actual lines for operator pending: makes dj delete entire line
onoremap k k
onoremap j j
" Easier to press 0 to move to beginning of line
nnoremap 0 ^
nnoremap ^ 0
" Splits
" Useful split commands
" <C-w>r Rotate splits
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><leader>v :vsp<CR>
nnoremap <leader><leader>h :sp<CR>
nnoremap <leader>= <C-w>=
nnoremap <leader>- <C-w>_
nnoremap <Right>   :vertical resize +5<CR>
nnoremap <Left>    :vertical resize -5<CR>
nnoremap <Down>    :resize +5<CR>
nnoremap <Up>      :resize -5<CR>

" Line bubbling in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" *** ETC
" Don't continue comment block from current line on nextline
autocmd FileType * set formatoptions-=cro

