"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-vividchalk'

Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mhinz/vim-signify'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'gregsexton/gitv'
Plugin 'elixir-lang/vim-elixir'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-bbye.git'
Plugin 'vim-scripts/The-NERD-Commenter'
Plugin 'dbakker/vim-projectroot'
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
compiler ruby
scriptencoding utf-8

set autoindent
set hlsearch
set incsearch
set number
set ruler
set showcmd
set expandtab
set splitright
set diffopt+=vertical
set tabstop=2 shiftwidth=2 softtabstop=2
set list listchars=tab:»▸,trail:·,nbsp:·
set laststatus=2
set wildmenu
set wildmode=list:longest,list:full
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set tags=./tags;$HOME
set nobackup
set noswapfile
set history=2000
" 退格键设置
set backspace=indent,eol,start
" set autochdir                   " 自动设置目录为正在编辑的文件所在的目录
" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

"可以在buffer的任何地方使用鼠标
set mouse=n
set selection=exclusive
set selectmode=mouse,key
" 左下角显示当前vim模式
set showmode
" 代码折叠
set foldenable
"" 折叠方法
"" manual    手工折叠
"" indent    使用缩进表示折叠
"" expr      使用表达式定义折叠
"" syntax    使用语法定义折叠
"" diff      对没有更改的文本进行折叠
"" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"" 使用syntax方式的代码折叠会导致操作卡顿，慎用！！！
set foldmethod=syntax
set foldlevel=99
"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
  set autoread
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" input source improve for gui vim
if has("gui_running")
  set noimdisable
  set imi=2
  set ims=2
  set bs=2
  set shell=/bin/zsh
  colorscheme molokai
endif

autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader键
let mapleader=" "
let g:mapleader=" "

" 开始结束键修改为H和L
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 映射切换buffer的键位
nnoremap bh :bp<CR>
nnoremap bl :bn<CR>

" 复制粘贴快捷键
vmap <C-c> :w !pbcopy<cr><cr>
nmap <C-v> :r !pbpaste<cr><cr>

" Bbye设置
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>

nnoremap <leader>l @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> "空格控制折叠"

runtime! macros/matchit.vim

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] =~ '\s'
    return "\<Tab>"
  else
    return "\<C-n>"
  endif
endfunction
inoremap <Tab>   <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-p>

nnoremap <leader><leader>   <c-^>
nnoremap <silent> <leader>w <C-w>v<C-w>l
nnoremap <silent> <leader>d :noh<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>b :Tagbar<CR>
nnoremap <silent> <leader>l :VimShell<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>

function! MyToggleNERDTreeFind()
  if g:NERDTree.IsOpen()
    NERDTreeClose
  else
    NERDTreeFind
  endif
endfunction
noremap <silent> <leader>t :call MyToggleNERDTreeFind()<CR>

function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>o :ZoomToggle<CR>

vmap <Enter> <Plug>(EasyAlign)
nmap ga      <Plug>(EasyAlign)

let g:vimshell_editor_command='/usr/local/bin/vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <C-p>     :call Unite_ctrlp()<cr>
nnoremap <leader>f :call Unite_ctrlp()<CR>
nnoremap <Leader>s :call Unite_ctrls()<CR>
nnoremap <leader>e :<C-u>Unite  buffer bookmark<CR>
nnoremap <leader>r :<C-u>Unite  file_mru<CR>
nnoremap <leader>y :<C-u>Unite  history/yank<CR>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  set number
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
    \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
    \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command =
    \ 'ag --follow --nocolor --nogroup --hidden -g ""'
endif
function! Unite_ctrlp()
  execute ':Unite  -buffer-name=files -start-insert buffer file_rec/async:'.ProjectRootGuess().'/'
endfunction
function! Unite_ctrls()
  execute ':Unite -auto-preview grep:'.ProjectRootGuess().'/'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <C-l> <C-x><C-o>
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><C-j> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<C-j>"
smap <expr><C-j> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<C-j>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase  = 1
map f <Plug>(easymotion-bd-w)
map F <Plug>(easymotion-sn)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme             = 'solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme monokai

if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14 //powerline字体
endif
