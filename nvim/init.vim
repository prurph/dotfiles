" *** init.vim
let mapleader = " "

" *** Plugins
" vim-plug lives in ~/.config/nvim/autoload/plug.vim
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
  Plug 'chriskempson/base16-vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'jez/vim-superman'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'jgdavey/tslime.vim'

  Plug 'mboughaba/i3config.vim'
  Plug 'chrisbra/csv.vim'
  Plug 'vim-scripts/paredit.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'wellle/tmux-complete.vim'
  Plug 'honza/vim-snippets'

  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
call plug#end()

" Plugin Settings
" vim-markdown (included)
let g:markdown_fenced_languages = [
  \ 'bash=sh',
  \ 'css',
  \ 'html',
  \ 'java',
  \ 'python',
  \ 'ruby',
  \ 'scala',
  \]
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

" tmuxline will pull colors from vim-airline, but only once vim is started
" to generate a persistent conf file, you can install the plugins, then:
"   1. in vim, `:TmuxlineSnapshot <path-to-file>`
"   2. in tmux.conf, `source <path-to-file>`
"   3. don't enable the extension inside vim in that case (as below)
if filereadable(expand("$XDG_CONFIG_HOME/tmux/tmuxline"))
  let g:airline#extensions#tmuxline#enabled = 0
endif
if (has("termguicolors"))
  set termguicolors
endif

" TODO: remap warning to orange instead of red (differentiate from error).
" see: https://github.com/EvanPurkhiser/dots-personal/commit/cf5e1654c96f07471bf784f25905e56d771f28d9#diff-a332aab47b5a34460552ff4aad4d38a80dc9c39f5346ea466c0afa9907708260
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
colorscheme base16-ocean

" scmindent
" https://github.com/ds26gte/scmindent
" https://crash.net.nz/posts/2014/08/configuring-vim-for-sicp/
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.lua

" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tsline_ensure_trailing_newlines = 1

vmap <leader>x <Plug>SendSelectionToTmux
nmap <leader>x <Plug>NormalModeSendToTmux
nmap <leader><leader>x <Plug>SetTmuxVars

" coc.nvim
" There are many other commands I don't have bound.
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-prettier',
  \ 'coc-tsserver'
  \ ]
set cmdheight=2
" Don't pass messages to |ins-completion-menu|
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" coc-prettier
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Hover tooltip
" This can be automated, see: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim#tool-tip-documentation-and-diagnostics
" However I found this very annoying as it spews errors on language servers that
" don't support doHover (the autocmds could be scoped to filetype)
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" Requires coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" *** Options
" Managing options
" :set no<option>        Unset option

" :set <otpion>!         Toggle option
" :set <option>?         Get value
" :set <option>=<value>  Set value
" :set <option>+=<value> Add value (number) or append value (string)
set mouse=a
set noerrorbells
set updatetime=100

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
set wildmode=longest,full

syntax enable
syntax on

filetype on
filetype indent on
filetype plugin on

" *** Keybinds
" Registers
" Use system clipboard, on Linux:
"   + is clipboard (ctrl-c/v in apps, ctrl+option+c/v in Urxvt)
"   * is primary   (middle mouse)
" I use leader y/p and clipboard so I can ctrl+[option+]c/v everywhere
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p
" Deletes don't overwrite register, except dd
" TODO: find a better key for this. S would be good but vim-sneak uses it.
" nnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D
" Leave dd as it is
" nnoremap dd dd

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
" <C-w>s horizontal split
" <C-w>v vertical split
set splitbelow
set splitright
if !exists(":TmuxNavigate*")
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
endif
" Split with ctrl-h for consistency with everything else
nnoremap <silent> <C-w>h :sp<CR>
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

" Style overrides. Cool notes:
" :hi                       see all highlight groups
" :hi CursorLineNR          see specific highlight groups
" :verbose hi CursorLineNR  see what is setting highlight group

" Set colors of signs in the gutter; backgrounds match base16-ocean gutter.
hi CocErrorSign ctermfg=1 ctermbg=10 guifg=#bf616a guibg=#343d46
hi CocWarningSign ctermfg=9 ctermbg=10 guifg=#d08770 guibg=#343d46
hi CocInfoSign ctermfg=5 ctermbg=10 guifg=#b48ead guibg=#343d46
hi CocHintSign ctermfg=2 ctermbg=10 guifg=#a3be8c guibg=#343d46
" NB: alacritty doesn't support undercurl (shows as undelrine): https://github.com/alacritty/alacritty/issues/1628
" but kitty does.
" The error highlight looks a little janky b/c it conflicts with some some other
" error diplay--eg for invalid JSON--and so I've overriden the background too.
" Could override the specific syntax error highlight groups.
hi CocErrorHighlight ctermfg=1 ctermbg=0 guifg=#bf616a guibg=#2b303b gui=undercurl term=undercurl
hi CocWarningHighlight ctermfg=9 ctermbg=0 guifg=#d08770 guibg=#2b303b gui=undercurl term=undercurl
hi CocInfoHighlight ctermfg=5 ctermbg=0 guifg=#b48ead guibg=#2b303b gui=undercurl term=undercurl
hi CocHintHighlight ctermfg=2 ctermbg=0 guifg=#a3be8c guibg=#2b303b gui=undercurl term=undercurl
