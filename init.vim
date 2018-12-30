" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'rking/ag.vim'
Plug 'sandeepcr529/Buffet.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'clojure-vim/async-clj-omni'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
"Plug 'vim-scripts/paredit.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'elzr/vim-json'
Plug 'vim-scripts/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'thinca/vim-ft-clojure'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'
Plug 'mattreduce/vim-mix'
Plug 'frost/vim-eh-docs'
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-mix-format'
Plug 'jacoborus/tender.vim'
"
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-rooter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'
Plug 'mtth/scratch.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
Plug 'ruanyl/vim-fixmyjs'
Plug 'bhurlow/vim-parinfer'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'marijnh/tern_for_vim'
call plug#end()
" }}}
" Basic options {{{
let g:python_host_prog='/usr/local/bin/python'
set nocompatible
set termguicolors
set modelines=0
set ts=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set formatoptions=l
set lbr
set number
set gdefault
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set ofu=syntaxcomplete#Complete
set guioptions-=t
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=R
set guioptions-=B
set guioptions-=M
set nobackup
set noswapfile
set virtualedit=block
set splitbelow
set splitright
set lsp=1
set relativenumber
set timeoutlen=1000 ttimeoutlen=0
" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
if getcwd() == $HOME
    cd $HOME/Documents/onelink
endif
set noautoread

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Refresh current buffer if file changed
autocmd BufEnter,FocusGained * checktime

" }}}
" Trailing whitespace  {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" Disable preview scratch window 
set completeopt=longest,menuone,preview
" <CR>: close popup and save indent.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}
" Key Mapping {{{
noremap <leader>j :%!python -m json.tool<CR>
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap j gj
nnoremap k gk
" nnoremap <C-a> ^
" nnoremap <C-e> $
nnoremap <up> g<up>
nnoremap <down> g<down>
"
"Show hidden chars
nmap <C-h> :set list!<CR>

" Map Ctrl-t to open a new editor tab, Ctrl-j and Ctrl-k for tab navigation
nmap <C-n> :tabnew<CR>
nmap <C-j> :tabprevious<CR>
nmap <C-k> :tabnext<CR>

noremap <C-up> <C-u>
noremap <C-down> <C-d>
map <leader>ve :e $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>
" Resizing
map <silent> <A-left> 5<C-w><
map <silent> <A-down> 5<C-W>-
map <silent> <A-up> 5<C-W>+
map <silent> <A-right> 5<C-w>> 
" Clean trailing whitespace
nnoremap <leader>cw mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" Gundo
nnoremap <leader>u :GundoToggle<CR>
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" Made D behave
nnoremap D d$
nmap gV `[v`]
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*<c-o>:call winrestview(stay_star_view)<cr>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
inoremap <C-Return> <CR><Esc>O
" Switch word cases
nnoremap <leader>tu gUiw
nnoremap <leader>tl guiw
" }}}
" Colors and fonts {{{
syntax on
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_overrides = {
\    'MatchParen': {'guifg': 'ccff04',
\                   'guibg': 'None',
\                   'gui': 'BOLD', 
\                   'cterm': 'BOLD', 
\                   'ctermfg': '226',
\                   'ctermbg': 'None',
\                   'attr': 'bold'},
\   'Search': {     'gui': 'UNDERLINE', 
\                   'cterm': 'UNDERLINE', 
\                   'guifg': '95BDAE',
\                   'guibg': '603D36',
\                   'attr': 'underline'}
\}
 
set background=dark
colorscheme onedark
" set gfn=InconsolataGo\ Nerd\ Font:h19

" Airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}
" NerdTree {{{
let NERDTreeIgnore = ['\.pyc$', '\.orig$', 'node_modules']	
let NERDTreeQuitOnOpen=1


" returns true if is NERDTree open/active
function! NTisNTOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

function! NTImprovedToggle()
    if NTisNTOpen()
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

map <leader><leader>o :call NTImprovedToggle()<CR>
" }}}
" ALE {{{
let g:ale_open_list=1
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_text_changed='normal'
let g:ale_python_flake8_args = '--ignore=E --select=E128'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

" }}}
" deoplete {{{
let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1 
let g:necoghc_enable_detailed_browse = 1
let g:deoplete#disable_auto_complete=0
let g:deoplete#auto_completion_start_length=3
let g:haskellmode_completion_ghc = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:neosnippet#enable_completed_snippet = 1
let g:autocomplete_flow#insert_paren_after_function = 1
autocmd CompleteDone * pclose
autocmd FileType python setlocal omnifunc=jedi#completions
" }}}
" Folding {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" Clojure  {{{
set lispwords+=ns,if-not,match,when-not,defstate
" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

let g:clojure_fold_extra = [
            \ 'defgauge',
            \ 'defmeter',
            \ 'defhistogram',
            \ 'defcounter',
            \ 'deftimer',
            \
            \ 'defdb',
            \ 'defentity',
            \ 'defaspect',
            \ 'add-aspect',
            \ 'defmigration',
            \
            \ 'defsynth',
            \ 'definst',
            \ 'defproject',
            \
            \ 'defroutes',
            \
            \ 'defrec',
            \
            \ 'defparser',
            \
            \ 'defform',
            \ 'defform-',
            \
            \ 'defpage',
            \ 'defsketch'
            \
            \ ]

let g:clojure_highlight_extra_defs = [
            \ 'defparser',
            \ 'deftest',
            \ 'match',
            \
            \ 'defproject',
            \
            \ 'defroutes'
            \ ]

let g:clojure_conceal_extras = 1
set wildignore+=classes
set wildignore+=lib
augroup ft_clojure
    au!

    au BufNewFile,BufRead riemann.config set filetype=clojure
    au FileType clojure silent! call TurnOnClojureFolding()
    "au FileType clojure compiler clojure
    au FileType clojure setlocal report=100000

    " Indent top-level form.
    au FileType clojure nmap <buffer> <localleader>= mz99[(v%='z
    " ])
augroup END
au FileType clojure let loaded_delimitMate = 0
let g:delimitMate_expand_cr = 1
" }}}
" Paredit {{{
let g:paredit_leader='\'
let g:paredit_smartjump=1
let g:paredit_electric_return=1
let g:paredit_matchlines=300
let g:paredit_shortmaps=0
let g:sexp_enable_insert_mode_mappings=0
au FileType lfe call PareditInitBuffer()
" }}}
" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" CtrlP {{{
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|orig)$'
            \ }
nnoremap <leader>f :CtrlPLine<cr>

" if executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" endif
"
cnoreabbrev Ag Ag!

noremap <silent> qq :Bufferlist<CR>
" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" }}}
" Bufferline {{{
let g:bufferline_echo = 0
" }}}
" Rainbow Partnheses {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Vivi (Elixir)   {{{
let g:vivi_enable_auto_warm_up_iex = 1
let g:vivi_enable_omni_completion = 1
"}}}
" WebDevIcons {{{
" loading the plugin 
let g:webdevicons_enable = 1

" adding the flags to NERDTree 
let g:webdevicons_enable_nerdtree = 1

" adding the custom source to unite 
let g:webdevicons_enable_unite = 1

" adding to vim-airline's tabline 
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline 
let g:webdevicons_enable_airline_statusline = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs 
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags 
let g:webdevicons_conceal_nerdtree_brackets = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically 
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
"}}}
let g:sneak#s_next = 1
let g:sneak#label = 1
let g:vim_json_syntax_conceal = 0
let g:ehdocs_map_keys=0

" rooter {{{
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1
" }}}

" js and jsx {{{
let g:vim_jsx_pretty_colorful_config = 1
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
"few nicer JS colours
"highlight xmlAttrib ctermfg=121
"highlight jsThis ctermfg=blue
"highlight jsSuper ctermfg=13
"highlight jsFuncCall ctermfg=cyan
"highlight jsComment ctermfg=245 ctermbg=none
"highlight jsClassProperty ctermfg=14 cterm=bold
"}}}
" fixmyja {{{
let g:fixmyjs_engine = 'eslint'
noremap <Leader><Leader>f :Fixmyjs<CR>
let g:fixmyjs_legacy_jshint = 1
" }}}
" YCM {{{
" see https://github.com/Valloric/YouCompleteMe/issues/234#issuecomment-159824241
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
" }}}
"

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
