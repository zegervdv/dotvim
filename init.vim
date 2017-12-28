" vim:fdm=marker:ts=2:sw=2

let s:darwin = has('mac')
let s:windows = has('win32')

" Include Vim-Plug {{{
if !s:windows
  if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !mkdir -p ~/.config/nvim/autoload
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
  else
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !mkdir -p ~/.vim/autoload
      silent !curl -fLo ~/.vim/autoload/plug.vim
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall
    endif
  endif
endif

" }}}
" Vim-Plug {{{
let g:plug_window='topleft new'

if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" General Plugins
if !has("nvim")
  Plug 'tpope/vim-sensible'
endif

if s:darwin
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'vim-scripts/gitignore'
endif

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'einfachtoll/didyoumean'

" Session Management
Plug 'tpope/vim-obsession'

" Spelling
Plug 'tpope/vim-abolish'

" Settings
Plug 'sgur/vim-editorconfig'

" Brackets
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate', { 'on' : [] }
augroup load_delimitmate
  autocmd!
  autocmd InsertEnter * call plug#load('delimitMate') | autocmd! load_delimitmate
augroup END

" Formatting
Plug 'junegunn/vim-easy-align', { 'on' : [] }
augroup load_easy_align
  autocmd!
  autocmd CursorHold,CursorHoldI * call plug#load('vim-easy-align') | autocmd! load_easy_align
augroup END

" Comments
Plug 'tpope/vim-commentary'

" Moving in files
Plug 'wellle/targets.vim', { 'on': [] }
augroup load_targets
  autocmd!
  autocmd InsertEnter * call plug#load('targets.vim') | autocmd! load_targets
augroup END
Plug 'mhinz/vim-grepper', { 'on' : 'Grepper' }

" Indentation
Plug 'nathanaelkane/vim-indent-guides'

" Command line
Plug 'tpope/vim-eunuch', { 'on' : ['Remove', 'Unlink', 'Move', 'Rename', 'Mkdir', 'Chmod', 'Find', 'Locate', 'SudoEdit', 'SudoWrite']}

if has("nvim")
  Plug 'kassio/neoterm', { 'on' : 'Ttoggle' }
else
  if s:darwin
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
  endif
endif

" Undoing
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }

" Pasting
Plug 'junegunn/vim-peekaboo'

" Tabs
Plug 'gcmt/taboo.vim'

" Other
Plug 'yuttie/comfortable-motion.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'roxma/vim-tmux-clipboard'

" Completing and snippets
if !has('nvim')
  Plug 'ervandew/supertab'
else
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'w0rp/ale', { 'for': ['vim', 'coffee', 'yaml'] }
  Plug 'roxma/nvim-completion-manager'
endif
Plug 'sirver/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets', { 'on': [] }
augroup load_ultisnips
   autocmd!
   autocmd InsertEnter * call plug#load('ultisnips') | autocmd! load_ultisnips
   autocmd InsertEnter * call plug#load('vim-snippets') | autocmd! load_ultisnips
augroup END


" Vim file navigation
" Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-projectionist'

" Theme
Plug 'NLKNguyen/papercolor-theme'

"Tcl
Plug 'vim-scripts/tcl.vim--smithfield-indent', { 'for': 'tcl'}

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

  " Jade
  Plug 'digitaltoad/vim-jade', { 'for': 'jade' }

  " Latex
  Plug 'lervag/vimtex', { 'for': 'tex' }
endif

" Coffeescript
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }


" C
Plug 'NLKNguyen/c-syntax.vim', { 'for': 'c'  }

" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Git
Plug 'tpope/vim-git'
call plug#end()
" }}}

" Activate built in plugins {{{
if !has('nvim')
  if has('packages')
    packadd! matchit
    packadd! shellmenu
  endif
endif
source $VIMRUNTIME/ftplugin/man.vim

if has('packages') && (!s:darwin && !s:windows) && !exists('$NVIM_NOPACK')
  packadd! log_file
  packadd! browsify
  packadd! snippets
endif

if has("nvim")
  let g:python3_host_prog="/project/asic_fpga/tools/nvim/python3/bin/python3.6"
  let g:python_host_prog='/project/asic_fpga/tools/vim/python/bin/python2.7'
endif
" }}}

" General Settings and options {{{

" Backspace over everything, like normal 
set backspace=2

" Buffers
set autoread " Read external changes
set hidden " Change between buffers without saving
set autowriteall " Write changes when losing focus

" Visuals
set number
set relativenumber
set ruler
syntax on
set title
set scrolloff=4 " Stay 4 lines from top/bottom
set showcmd

" Theme and style
" Override needs to be defined before calling colorscheme
function! IndentGuidesColor() abort
  highlight IndentGuidesOdd ctermbg=254
  highlight IndentGuidesEven ctermbg=254
endfunction

augroup IndentColors
  autocmd!
  autocmd ColorScheme * call IndentGuidesColor()
augroup END

set background=light
if !has("nvim")
  set t_Co=256
end
colorscheme PaperColor
if s:darwin
  set background=dark
  colorscheme tomorrow-night
  set guifont=inconsolata:h13
elseif s:windows
  set background=light
  colorscheme PaperColor
  set guifont=consolas:h10
endif

if has('nvim')
  set notermguicolors
endif

set showmatch " Highlight matching brackets

set wrap " Wrap lines
set wrapmargin=2 " Stay 2 chars from side
set textwidth=79
set colorcolumn=81
set linebreak " Smarter wrapping
if v:version > 703
  set breakindent " Indent wrapped lines to same level
endif

set fixendofline

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
if has('nvim')
  set inccommand=nosplit
endif

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
set guioptions-=a
set guioptions-=m
set guioptions-=T
set guioptions+=c

set history=100 " Set history 100
set wildmenu " Command completion
set wildmode=full " Complete to fullest match
set ttyfast " Use a fast terminal
set lazyredraw " No need to redraw constantly

set ttimeoutlen=-1 " Set the timeout to a minimum
set diffopt+=iwhite " Ignore spaces in diffs"

set tags=.git/tags,tags,/project/asic_fpga/tools/vim/share/vim/vimfiles/tags

" Have find look through all folders
set path+=**
" Add PRJROOT and subdirs to path if it is set
if exists('$PRJROOT')
  set path+=$PRJROOT/**
endif

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
" set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

" Enable cursorline
set cursorline
augroup cline
  au!
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

if !s:windows
  set list
  set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:+
endif

set sessionoptions-=options

" Scan files for completion
set complete=.,w,b,u,k,kspell,t,i,d
set completeopt=menuone,longest,preview,noinsert

set splitright
set virtualedit=block

if v:version > 703
  set conceallevel=0
  if !has('nvim')
    set cryptmethod=blowfish2
  endif
endif

filetype plugin indent on

set pastetoggle=<F2> " Toggle to paste mode

if v:version >= 703
  set undofile
endif
set undolevels=1000
set backup
set noswapfile
if has('nvim')
  " set viminfo+=n~/.config/nvim/.viminfo
  set backupdir=~/.config/nvim/tmp/backup/,.
  set directory=~/.config/nvim/tmp/swap//,.
else
  set viminfo+=n~/.vim/.viminfo
  set backupdir=~/.vim/tmp/backup/,.
  set directory=~/.vim/tmp/swap//,.
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

if v:version >= 703
  if has('nvim')
    set undodir=~/.config/nvim/tmp/undo//,.
  else
    set undodir=~/.vim/tmp/undo//,.
  endif
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.bin,*.elf,*.hex,*.eps,.git/**,*.dup,.hg/**,*.orig,*.*~

" No selecting via mouse (stops visual selection when scrolling)
set mouse=nic

" }}}
" Status line {{{
function! Status()
  hi User1 guifg=#df875f guibg=NONE
  let l:statusline = ''
  let l:statusline .= '%n\ '
  let l:statusline .= "%{expand('%:h')}/"
  let l:statusline .= '%t'
  let l:statusline .= '%m'
  let l:statusline .= "\ [%{strlen(&ft)?&ft:'unknown'}]"
  let l:statusline .= '%='
  if exists('b:tcl_errors')
    let l:statusline .= b:tcl_errors
  endif
  " let statusline .= "%P\ "
  if s:darwin
    if exists('*fugitive#head')
      let l:head = fugitive#head()

      if empty(l:head) && exists('*fugitive#detect') && !exists('b:git_dir')
        call fugitive#detect(getcwd())
        let l:head = fugitive#head(5)
      endif
    endif

    if !empty(l:head)
      let l:statusline .=  ' on ' . l:head . '%* '
    endif
  endif
  return l:statusline
endfunction
set laststatus=2
set statusline=%!Status()
" }}}
" Fix Colors in colorscheme {{{
function! SpellHighlights() abort
  highlight SpellBad ctermbg=256 ctermfg=210
  highlight SpellLocal ctermbg=240 ctermfg=010
  highlight SpellCap ctermbg=256 ctermfg=211
endfunction
augroup SpellColors
  autocmd!
  autocmd ColorScheme * call SpellHighlights()
augroup END
"}}}

" Mappings {{{
" Set leader to spacebar
map <space> <leader>

" See long lines as line breaks
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

" Remap tag-search to better place
nnoremap <C-$> g<C-]>
nnoremap <C-y> g<C-]>
nnoremap <C-w>y <C-w>g<C-]>

nnoremap <C-s> <C-e>

" Move while in insert mode
inoremap <C-f> <right>

" Switch between the last two files
" nnoremap <space><space> <C-^>

" " Very Magic search patterns
nnoremap / /\v
vnoremap / /\v

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

" Open vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" Open dup in diffmode
nnoremap <leader>d :call OpenDup(@%)<CR>

function! OpenDup(file)
  let l:filename = a:file . ".dup"
  execute 'vsplit' l:filename
  windo diffthis
endfunction

" Do not move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" nnoremap <F10> :botright copen<CR>

" Error navigation
nnoremap <UP> :cprev<CR>
nnoremap <DOWN> :cnext<CR>
nnoremap <RIGHT> :cnf<CR>
nnoremap <LEFT> :cpf<CR>

nnoremap <leader>y :ptjump <c-r><c-w><CR>

function! ToggleDiff()
  if &diff == 1
    windo diffoff
  else
    windo diffthis
  endif
endfunction
nnoremap <leader>g :call ToggleDiff()<CR>

if has('nvim')
  tnoremap <space><esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  augroup enter_term
    au!
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  augroup END
endif

" Open buffers, tags... in vertical splits
nnoremap <leader>b :vert sbuffer 
nnoremap <leader>t :vert stjump 
nnoremap <leader>f :vert sfind 


" }}}

" Functions {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" Thg mappings
function! s:HGhist(file)
  if !empty(a:file)
    let path = a:file
  else
    let path = expand('%')
  endif
  exec 'silent! !thg filelog ' . path . ' &'
endfunction

command! -nargs=? -complete=file HGhist call s:HGhist(<q-args>)

augroup focus_lost
  au!
  au FocusLost * :wa
augroup END

" Resize splits after window resize {{{
augroup vim_resize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END
" }}}

" Automatically reload vimrc when saving {{{
augroup reload_vim
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
" }}}

" Reload diffs {{{
augroup diff_files
  au!
  au BufWritePost * if &diff == 1 | diffupdate | endif
augroup END
" }}}

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

" Detect Filetype from content if file has no extension {{{
augroup newFileDetection
  au!
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
" }}}

" Convert hex <-> decimal {{{
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction
" }}}

" Recognize filetype for dup files {{{
autocmd! BufRead *.dup call DupSetSyntax(@%)

function! DupSetSyntax(name)
  let extension = matchlist(a:name, '\v.+.\.([^\.]+).dup')[1]
  if extension == "vhd"
    setlocal filetype=vhdl
  elseif extension == "v"
    setlocal filetype=verilog
  elseif extension == "sv"
    setlocal filetype=verilog
  else
    echo "Unknown filetype"
  endif
endfunction
" }}}

" Create arguments list from files in quickfix list
" Allows to Grep for a pattern and apply an argdo command on each of the
" matching files {{{
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
"}}}

augroup mark_files
  au!
  au BufLeave test.tcl mark T
  au BufLeave case.do mark C
  au BufLeave drv_*.tcl mark D
  au BufLeave *.rtl.vhd mark R
augroup END


" Toggle between opening/closing the quickfix window {{{
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec('botright '.a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> <F10> :call ToggleList("Quickfix List", 'c')<CR>
" }}}
" }}}

" Filetype specific settings {{{
" Latex {{{
" Open pdf
nnoremap <leader>v :!open -a /Applications/TeX/TeXShop.app %:r.pdf<CR><CR>

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
augroup ft_text
  au!
  " au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_gb
  au BufNewFile,BufRead,BufEnter *.txt setlocal textwidth=0
augroup END
augroup ft_report
  au!
  au BufNewFile,BufRead,BufEnter *.rpt setlocal nowrap
  au BufNewFile,BufRead,BufEnter *.rpt call ColorRpt()
  au BufNewFile,BufRead,BufEnter *.log call ColorRpt()
augroup END

function! ColorRpt()
  " Color numbers based on length
  syn match String "\v<\d{1,3}>"   
  syn match Number "\v<\d{4,6}>"   
  syn match Statement "\v<\d{7,9}>"

  " Color errors
  syn match Error "\v^ERROR:.*$"
endfunction
" }}}
" Git commit messages {{{
augroup ft_git
  au!
  au FileType gitcommit setlocal spell spelllang=en_gb
augroup END
" }}}
" Ruby {{{
augroup ft_ruby
  au!
  autocmd BufRead *_spec.rb set filetype=rspec
augroup END
" }}}
" Matlab {{{
augroup ft_matlab
  au!
  autocmd FileType matlab setlocal commentstring=\%\ %s
augroup END
" }}}
" C {{{
augroup ft_c
  au!
  au FileType c setlocal foldmethod=syntax
augroup END
" }}}
" VHDL {{{
" VHDL ctags
let g:tlist_vhdl_settings = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
let g:vhdl_indent_genportmap =0
let g:vhdl_indent_rhassign = 1

augroup ft_vhdl
  au!
  autocmd FileType vhdl call VHDLColonAlign()
  autocmd FileType vhdl setlocal commentstring=--\ %s
  autocmd FileType vhdl call VHDLChipScopeMacro()
augroup END

function! SetAutoAlign()
  inoremap <silent> => =><ESC>mzvip:EasyAlign/=>/<CR>`z$a
endfunction

function! VHDLChipScopeMacro()
  let @c = "mtyiw'Sosignal \"_cs : std_logic;'Coattribute mark_debug of \"_cs : signal is \"true\";attribute dont_touch of \"_cs : signal is \"true\";'Do\"_cs <= \";=='t"
endfunction

function! VHDLColonAlign()
  let g:easy_align_delimiters = {
        \  ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0}
        \}
endfunction
" }}}
" TCL {{{

augroup ft_tcl
  au!
  autocmd FileType tcl setlocal commentstring=#\ %s
  " autocmd FileType tcl compiler nagelfar
  autocmd BufRead *.do set filetype=tcl
  autocmd FileType tcl setlocal iskeyword+=:
  autocmd FileType tcl setlocal suffixesadd+=.tcl,.do
augroup END
" shortcuts
iabbrev procargs array set arg [::argument_processing::proces_arguments $args];
" }}}
" GPG {{{
" Don't save backups of gpg asc files
set backupskip+=*.asc

" Convenient editing of ascii-armoured encrypted files
augroup GPGASCII
  au!
  au BufReadPost *.asc :%!gpg -q -d
  au BufReadPost *.asc |redraw
  au BufWritePre *.asc :%!gpg -q -e -a
  au BufWritePost *.asc u
  au VimLeave *.asc :!clear
augroup END
" }}}
" System Verilog {{{
augroup ft_systemverilog
  au!
  au FileType systemverilog setlocal suffixesadd+=.sv,.v
  au FileType systemverilog setlocal foldmethod=marker
  au FileType systemverilog,verilog call SVAlign()
  au FileType systemverilog,verilog let b:delimitMate_quotes = "\" '"
augroup END

function! SVAlign()
  let g:easy_align_delimiters = {
        \  ')': { 'pattern': '[()]', 'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0}
        \}
endfunction
" }}}
" Make {{{
augroup ft_make
  autocmd!
  autocmd BufEnter *.make setlocal filetype=make
  autocmd FileType make setlocal noexpandtab
augroup END
" JSON {{{
augroup ft_json
  autocmd!
  autocmd FileType json setlocal equalprg=jq
augroup END
" }}}
" }}}
" }}}

" Plugin settings {{{
" Easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Gundo tree {{{
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Projectionist {{{
let g:projectionist_heuristics = {
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
" Grep {{{
let g:grepper = {
      \ 'tools': ['ag', 'hg'],
      \ 'highlight': 1,
      \ 'ag': { 
      \  'grepprg': 'ag --path-to-agignore ~/.agignore --vimgrep',
      \ }}

nnoremap gs <plug>(GrepperOperator)
xnoremap gs <plug>(GrepperOperator)


command! -nargs=* -complete=file Ag Grepper -noprompt -tool ag -grepprg ag --vimgrep <args>
" }}}
" Vinegar/NetRW {{{
autocmd FileType netrw setl bufhidden=delete
" }}}
" DelimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" }}}
" NCM {{{
if has('nvim')
  inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  " inoremap <expr> <CR> (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
endif
" }}}
" Background make {{{
nnoremap <F9> :PMake<CR>
" }}}
" Ultisnips {{{
if has('nvim')
  let g:UltiSnipsExpandTrigger        = "<C-j>"
  let g:UltiSnipsJumpForwardTrigger   = "<C-j>"
  let g:UltiSnipsJumpBackwardTrigger  = "<C-k>"
endif
" }}}
" Neoterm {{{
let g:neoterm_size = '10'
let g:neoterm_autoinsert = 1
if has('nvim')
  nnoremap <space><space> :silent! Ttoggle<CR>
endif
" }}}
" Indentguides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 0

" }}}
" LanguageClient {{{
let g:LanguageClient_serverCommands = {
  \ 'vhdl': ['vhdl-tool', 'lsp'],
  \ 'dockerfile': ['docker-langserver', 'listen'],
  \ 'python': ['pyls']
  \ }

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" }}}
" }}}

" Load local vimrc
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

" Load project local vimrc
if filereadable('.vimrc.local')
  source .vimrc.local
endif
