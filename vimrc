" leader键
let mapleader=","
let g:mapleader=","
" history存储容量
set history=2000
" 文件修改之后自动载入。
set autoread
set nocompatible               " be iMproved
set encoding=utf8
filetype off

" 用于Macvim输入法切换问题
"set noimdisable
"autocmd! InsertLeave * set imdisable|set iminsert=0
"autocmd! InsertEnter * set noimdisable|set iminsert=0

" 空格后会有提示符
set list listchars=tab:»·,trail:·

" 复制粘贴快捷键
vmap <C-c> :w !pbcopy<cr><cr>
nmap <C-v> :r !pbpaste<cr><cr>
" 左下角显示当前vim模式
set showmode

"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
" 以上可以实现(、[、{、"、'  输入后自动补全右边部分，光标也会位于中间位置。

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"可以在buffer的任何地方使用鼠标
set mouse=n
set selection=exclusive
set selectmode=mouse,key

"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
    set autoread
endif

" 1 tab to 2 space for ruby
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ruler               "右下角显示光标位置"
set hlsearch        " 高亮显示搜索结果"
set incsearch       " 及时输入查询
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录"
" number line show 
set nu

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
 " 设置在状态行显示的信息

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
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> "空格控制折叠"

" 缩进配置
set smartindent   " Smart indent
set autoindent    " 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on
" autoindenting

" tab相关变更
set tabstop=2     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=2  " 每一次缩进对应的空格数
set softtabstop=2 " 按退格键时可以一次删掉2个空格
set smarttab      " insert tabs on the start of a line according to
" shiftwidth, not tabstop 按退格键时可以一次删掉 2个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用
" Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting
" with '<' and '>'

" input source improve for gui vim
if has("gui_running")
  set noimdisable
  set imi=2
  set ims=2
endif

set noswapfile
"in order to switch between buffers with unsaved change
set hidden

" hightlight col and line
set cursorline
"set cursorcolumn

set gfn=Monaco:h16
if has("gui_running")
  colorscheme desert
  set bs=2
  set shell=/bin/zsh
endif

" Bundle Plugin here for Ruby on Rails
" git
Bundle 'tpope/vim-fugitive'
" ruby command for rvm
Bundle 'tpope/vim-rvm'
" quickly move cursor, try ,,w 
Bundle 'Lokaltog/vim-easymotion'
" quickly write HTML, just like zencoding but simple engough
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
let g:sparkupNextMapping= "<c-m>"
" power vim plugin for rails
Bundle 'tpope/vim-rails.git'
" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete
" quickly comment your code, try ,cc on selected line
Bundle 'vim-scripts/The-NERD-Commenter'
" indent guides
let g:indent_guides_guide_size = 1
Bundle 'nathanaelkane/vim-indent-guides'
" indent guides shortcut
map <silent><F7>  <leader>ig
Bundle 'terryma/vim-multiple-cursors.git'

" file tree like something called IDE
Bundle 'scrooloose/nerdtree'
let NERDTreeAutoCenter=1
let NERDTreeWinPos='left'
map <silent><F8> :NERDTree<CR>
" slim template support
Bundle 'slim-template/vim-slim.git'
" coffeescript
Bundle 'kchmck/vim-coffee-script'
" basic dependence
Bundle 'L9'
" quickly search file(s), use ctrl+p, F5 refresh
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" ctrl+o for LRU buffer
map <c-o> :CtrlPBuffer<CR>

Bundle "scrooloose/nerdcommenter.git"

filetype plugin indent on     " required! 
syntax on

" sass highlight
Bundle 'JulesWang/css.vim'
Bundle 'cakebaker/scss-syntax.vim'

Bundle 'bling/vim-airline.git'
" airline设置
set laststatus=2
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

" 映射切换buffer的键位
nnoremap bh :bp<CR>
nnoremap bl :bn<CR>

Bundle 'vim-scripts/winmanager.git'
set iskeyword+=-

Bundle 'moll/vim-bbye.git'
" Bbye设置
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
nnoremap bd :Bd<CR>

Bundle 'mileszs/ack.vim.git'
Bundle 'dyng/ctrlsf.vim'
let g:ctrlsf_auto_close = 0

Bundle 'msanders/snipmate.vim'
" WinManager设置
" NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]" 
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
 
function! NERDTree_IsValid()
    return 1
endfunction

Bundle 'tpope/vim-surround.git'

",# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`
 
" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=35

" 窗口布局
let g:winManagerWindowLayout='NERDTree'

" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0


" 退格键设置
set backspace=indent,eol,start

" 开始结束键修改为H和L
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

Bundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Bundle 'tpope/vim-cucumber.git'

" theme主题
colorscheme monokai

if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14 //powerline字体
endif
