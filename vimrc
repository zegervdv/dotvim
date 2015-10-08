" vim:fdm=marker

let s:darwin = has('mac')

" Include Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
" Vim-Plug {{{
let g:plug_window='topleft new'
call plug#begin('~/.vim/plugged')
" General Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'vim-scripts/gitignore'
Plug 'einfachtoll/didyoumean'

" Session Management
Plug 'tpope/vim-obsession'

if s:darwin
  " Spelling
  Plug 'tpope/vim-abolish'
endif

" Brackets
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Formatting
Plug 'junegunn/vim-easy-align'
" Plug 'AndrewRadev/splitjoin.vim'

" Comments
Plug 'tpope/vim-commentary'

" Moving in files
Plug 'wellle/targets.vim'
" Plug 'ervandew/ag'
" Plug 'gabesoft/vim-ags'

Plug 'wincent/ferret'

" Finding files
if s:darwin
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  " Plug 'nixprime/cpsm', { 'do': './install.sh'}
endif
Plug 'kien/ctrlp.vim'

" Command line
Plug 'tpope/vim-eunuch', { 'on' : ['Remove', 'Unlink', 'Move', 'Rename', 'Mkdir', 'Chmod', 'Find', 'Locate', 'SudoEdit', 'SudoWrite']}

" Syntax and checking
if s:darwin
  Plug 'scrooloose/syntastic'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
endif

" Undoing
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" Pasting
Plug 'junegunn/vim-peekaboo'

" Tmux
if s:darwin
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
else
  nnoremap <C-l> <C-w>l
  nnoremap <C-k> <C-w>k
  nnoremap <C-j> <C-w>j
  nnoremap <C-h> <C-w>h
endif

Plug 'tpope/vim-dispatch'

" Completing and snippets
" Plug 'shougo/neocomplete.vim'
" Plug 'shougo/neosnippet.vim'
" Plug 'shougo/neosnippet-snippets'
" Plug 'valloric/youcompleteme', {'do': './install.py --clang-completer' }
Plug 'ervandew/supertab'

if v:version > 703
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
endif

" Vim file navigation
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'

" Theme
Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'

"Tcl
Plug 'tcl.vim--smithfield'
Plug 'tcl.vim--smithfield-indent'
Plug 'tcl_itcl.vim'

if s:darwin
  " Ruby
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'slim-template/vim-slim', { 'for': 'ruby' }
  Plug 'duwanis/tomdoc.vim', { 'for': 'ruby' }
  Plug 'keith/rspec.vim', { 'for': 'rspec' }

  " Markdown
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }

  " C
  Plug 'osyo-manga/vim-reunions', { 'for': 'c' }
  Plug 'osyo-manga/vim-marching', { 'for': 'c' }
  Plug 'NLKNguyen/c-syntax.vim'

  " Coffeescript
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

  " Jade
  Plug 'digitaltoad/vim-jade', { 'for': 'jade' }

  " Latex
  Plug 'lervag/vimtex', { 'for': 'tex' }
endif

" Git
Plug 'tpope/vim-git'
call plug#end()
" }}}

" Activate matchit {{{
if empty(glob('~/.vim/plugin/matchit.vim'))
  silent !mkdir -p ~/.vim/plugin
  silent !cp $VIMRUNTIME/macros/matchit.vim ~/.vim/plugin
endif
" }}}

" General Settings and options {{{
set nocompatible

" Backspace over everything, like normal 
set backspace=2

" Buffers
set autoread " Read external changes
set hidden " Change between buffers without saving
set autowriteall " Write changes when losing focus

" Visuals
set number
set ruler
syntax on
set title
set scrolloff=4 " Stay 4 lines from top/bottom

" Theme and style
if s:darwin
  set background=dark
  colorscheme tomorrow-night
  set guifont=inconsolata:h13
endif
if has("gui_running")
  set background=light
  colorscheme PaperColor
endif

set showmatch " Highlight matching brackets

set wrap " Wrap lines
set wrapmargin=2 " Stay 2 chars from side
set linebreak " Smarter wrapping
if v:version > 703
  set breakindent " Indent wrapped lines to same level
endif

set expandtab " Expand tabs to spaces
if s:darwin
  set tabstop=2 shiftwidth=2 " Tab is 2 spaces
else
  set tabstop=3 shiftwidth=3
endif

" Searching
set magic  " Use magic regexes
set hlsearch " Highlight all matches
set incsearch " Show matches while typing
set ignorecase " Ignore case when searching
set smartcase " Be case sensitive if at least one uppercase char is used
set gdefault " Default substitute all matches on a line

set autoindent " Automatically indent
set cindent " Indent based on C syntax
set cinwords+=foreach

if s:darwin
  set vb
endif
set noerrorbells " Don't beep

set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

set history=100 " Set history 100
set wildmenu " Command completion
set wildmode=longest:full " Complete to fullest match
set ttyfast " Use a fast terminal
set lazyredraw " No need to redraw constantly

set ttimeoutlen=10 " Set the timeout to a minimum
set diffopt+=iwhite " Ignore spaces in diffs"

set tags=.git/tags,tags

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

" Enable cursorline
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

if s:darwin
  set list
  set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:+,eol:¬
endif

set sessionoptions-=options

" Scan files for completion
set complete=.,w,b,u,k,kspell,t,i,d
set completeopt=menuone,longest,preview

set splitright
set virtualedit=block

if v:version > 703
  set conceallevel=0
  set cryptmethod=blowfish
endif

filetype plugin indent on

set pastetoggle=<F2> " Toggle to paste mode
set clipboard=unnamed

if v:version >= 703
  set undofile
endif
set undolevels=1000
set backup
set viminfo+=n~/.vim/.viminfo
set backupdir=~/.vim/tmp/backup/,.
set directory=~/.vim/tmp/swap/,.
if v:version >= 703
  set undodir=~/.vim/tmp/undo/,.
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.bin,*.elf,*.hex,*.eps,.git/**,*.dup

" }}}
" Status line {{{
function! Status()
  let statusline = ''
  let statusline .= "%n\ "
  let statusline .= "%f"
  let statusline .= "%m"
  let statusline .= "\ [%{strlen(&ft)?&ft:'unknown'}]"
  let statusline .= "%="
  " let statusline .= "%P\ "
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head(5)
    endif
  endif

  if !empty(head)
    let statusline .=  ' on ' . head . '%* '
  endif
  return statusline
endfunction
set laststatus=2
set statusline=%!Status()
" }}}
" Fix Colors in colorscheme {{{
highlight SpellBad ctermbg=256 ctermfg=210
highlight SpellLocal ctermbg=240 ctermfg=010
highlight SpellCap ctermbg=256 ctermfg=211
"}}}

" Mappings {{{
" Set leader to spacebar
map <space> <leader>

" See long lines as line breaks
map j gj
map k gk

" Remap tag-search to better place
nnoremap <C-$> <C-]>
nnoremap <C-y> <C-]>

nnoremap <C-s> <C-e>

nnoremap + <C-a>

" Move while in insert mode
inoremap <C-f> <right>

" Switch between the last two files
nnoremap <space><space> <C-^>

" " Very Magic search patterns
" nmap / /\v
" cmap s/ s/\v

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Clear highlight
nnoremap <silent><leader>l :noh<CR>

inoremap £ \

" Highlight last inserted text
nnoremap gV `[v`]

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Swap v and CTRL-V
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" Use backspace as delete in visual mode
vmap <BS> x

" Redraw screen
nnoremap <F3> :redraw!<CR>

" Keep selection when shifting
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
  set nosmartindent
  if mode() ==# "V"
    return a:cmd . ":set smartindent\<CR>gv"
  else
    return a:cmd . ":set smartindent\<CR>"
  endif
endfunction

" Swap backticks and quotes
nnoremap ` '
nnoremap ' `

" Open url in browser
nnoremap gb yiW:!open <C-r>*<CR><CR>

" Open vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
" }}}

" Functions {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Resize splits after window resize
au VimResized * exe "normal! \<c-w>="

" Custom folding by Steve Losh
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

" Detect Filetype from content if file has no extension
augroup newFileDetection
autocmd CursorMovedI * call CheckFileType()
augroup END

function! CheckFileType()
  if exists("b:countCheck") == 0
    let b:countCheck = 0
  endif
  let b:countCheck += 1
  if &filetype == "" && b:countCheck > 20 && b:countCheck < 200
    filetype detect
    " Delete the function if no filetype can be established, or the type has
    " been found
  elseif b:countCheck >= 200 || &filetype != ""
    autocmd! newFileDetection
  endif
endfunction

" Write all files when losing focus
autocmd FocusLost * silent! wa

" }}}

" Filetype specific settings
" Latex {{{
" Open pdf
" nnoremap <leader>v :!open -a /Applications/TeX/TeXShop.app %:r.pdf<CR><CR>
nnoremap <silent> <leader>v :!zathura %:r.pdf > /dev/null 2>&1&<CR><CR>

function! Latexprog()
  if !filereadable("./Makefile")
    setlocal makeprg=latexmk\ -interaction=nonstopmode\ -synctex=1\ -file-line-error\ -pdf\ %:r
  endif
endfunction

augroup latex
  autocmd!
  autocmd FileType tex call Latexprog()
  au BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=en_gb
  au BufNewFile,BufRead,BufEnter *.tex setlocal textwidth=0
  nnoremap <leader>ml :Dispatch latexmk -pdf %<CR>
augroup END
" }}}
" Markdown {{{
let g:vim_markdown_folding_disabled=1
" }}}
" Text {{{
au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_gb
au BufNewFile,BufRead,BufEnter *.txt setlocal textwidth=0
" }}}
" Git commit messages {{{
au FileType gitcommit setlocal spell spelllang=en_gb
" }}}
" Ruby {{{
autocmd BufRead *_spec.rb set filetype=rspec
" }}}
" Matlab {{{
autocmd FileType matlab setlocal commentstring=\%\ %s
" }}}
" C {{{
au FileType c setlocal foldmethod=syntax
" }}}
" VHDL {{{
" VHDL ctags
let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
" }}}
" Spice {{{
autocmd BufRead *.{net,lib} set filetype=spice
" }}}
" TCL {{{
autocmd FileType tcl setlocal commentstring=#\ %s
autocmd BufRead *.do set filetype=tcl
" }}}

" Plugin settings
" Easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Syntastic {{{
let g:syntastic_check_on_open=1
" }}}
" Gundo tree {{{
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Dispatch {{{
nnoremap <leader>m :Make<CR>
" }}}
" Easytags {{{
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1
" }}}
" FZF {{{
" nnoremap <silent> <C-p> :call fzf#run({'tmux_height': '20%', 'sink': 'e'})<CR>
" }}}
" Projectionist {{{
let g:projectionist_heuristics = {
      \ "sourceme.sh": {
      \   "design/**/rtl/*.rtl.vhd": {
      \     "type": "rtl",
      \     "alternate": "design/{dirname}/rtl/{basename}.entity.vhd"
      \   },
      \   "design/**/rtl/*.entity.vhd": {
      \     "type": "entity",
      \     "alternate": "design/{dirname}/rtl/{basename}.rtl.vhd"
      \   },
      \   "verification/tcl/*.tcl": {
      \     "type": "verification",
      \   },
      \   "test/*/test.tcl": {
      \     "type": "test"
      \   },
      \   "test/*/case.do": {
      \     "type": "case"
      \   },
      \   "*": { "make": "source sourceme.sh -a && cd compile_scripts && make" },
      \ },
      \ "*.c": {
      \   "*.c": {
      \     "alternate": "{}.h",
      \     "type": "source",
      \     "template": ["#include \"{}.h\""],
      \     "make": "make -wC {project}"
      \   },
      \   "*.h": {
      \     "alternate": "{}.c",
      \     "type": "header",
      \     "template": ["#ifndef {uppercase}_H", "#define {uppercase}_H", "", "#endif"]
      \   },
      \   "Makefile": {"type": "makefile"},
      \ },
      \ "*.py": {
      \   "*.py": { "make": "ipython {}" }
      \ },
      \ }
" }}}
" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
" }}}
" CtrlP {{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ".git" --ignore ".DS_Store" --ignore "node_modules" --hidden -g ""'
endif
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" }}}


" Load local vimrc
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Load project local vimrc
if filereadable(".vimrc.local")
  source .vimrc.local
endif
