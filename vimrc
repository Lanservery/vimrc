""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                常见问题                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set fileencodings=utf-8,gb2312,ucs-bom,gb18030,gbk,cp936    " 解决文件乱码问题
set termencoding=utf-8
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                基本配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set vb t_vb=    "关闭警告声
au GuiEnter * set t_vb=
set shortmess=atI    "启动时不显示援助索马里儿童提示
set clipboard=unnamedplus   "与Linux共享剪切板
set nobackup    "取消自动备份及产生swp文件
set nowb
set noswapfile
set undodir=/tmp
set undofile
filetype on    "打开文件类型检测功能
set autoread    "当文件被外部改变时自动读取
set splitbelow    "ternimal在下面打开
" disable vim to examine zipped files
let g:loaded_zipPlugin= 1
let g:loaded_zip      = 1
set hlsearch    " 高亮显示匹配结果
set incsearch           " 开启实时搜索功能
" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
" leader 键
let mapleader = "\<space>"
" 保存
nmap <leader>w :w<CR>
" 保存所有文件
nmap <leader>W :wa<CR>
" 退出
nmap <leader>q :q<CR>
" 关闭 buffer,主要解救buffer无法正常关闭问题
nmap <leader>c :bdelete<CR>
" 保存退出
nmap <leader>wq :wq<CR>
" 编辑和刷新配置
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Tab 切换
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>
" 分屏窗口移动
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
" 更改窗口大小
map <M-Left> <C-W><
map <M-Right> <C-W>>
map <M-Up> <C-W>=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   外观                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number    "显示行号
" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
"set relativenumber number
"au FocusLost * :set norelativenumber number
"au FocusGained * :set relativenumber
"" 插入模式下用绝对行号, 普通模式下用相对
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
" 语法高亮
syntax on
" gvim设置
if has("gui_running")
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono\ 12      " 设置字体
    set lines=43 columns=92    " 放在这里防止造成终端界面混乱
    set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T           " 隐藏工具栏
    set guioptions-=L           " 隐藏左侧滚动条
    set guioptions-=r           " 隐藏右侧滚动条
    set guioptions-=b           " 隐藏底部滚动条
    "set guicursor=n-v-c:ver5    " 设置光标为竖线
endif
set listchars=tab:>-,trail:.    " tab 字符的显示样式，且行末不显示字符
set list    " 显示Tab字符
set laststatus=2
set cursorline    " 光标所在的当前行高亮
"hi CursorLine cterm=NONE ctermbg=none
"hi CursorLineNR  cterm=none ctermbg=242

" Change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   编辑                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a    "支持使用鼠标
set expandtab    "Tab 转为空格
set tabstop=2
set softtabstop=2       "回退的长度
set shiftwidth=2        "每一级缩进的长度
filetype indent on     "不同文件类型采用不同缩进
set autoindent     "按下回车键后，保持与上一行的缩进一致
"set smartindent     "智能缩进
"命令模式下，底部操作指令按下 Tab 键自动补全
set wildmenu
set wildmode=longest:list,full
" 取消换行
set nowrap
"智能自动换行
"set linebreak
" 全选+复制
map <C-A> ggVG
map! <C-A> <Esc>ggVG

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   netrw                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_browse_split = 4     " Changing how files are opened
let g:netrw_liststyle = 3     "设置目录列表的样式：树形
let g:netrw_winsize = 24     "设置文件浏览器窗口宽度为 n%
let g:netrw_banner = 0    "Removing the banner
let g:netrw_altv = 1 " 控制 v 分裂的窗口位于右边
"let g:netrw_preview = 1 " 'p'预览默认是水平分割, 此项设置使之垂直分割
let g:netrw_alto = 0 " 控制预览窗口位于左侧或右侧, 与 netrw_preview 共同作用

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   插件                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
" startify放在devicons前面以显示图标
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons', { 'on': ['NERDTreeToggle'] }
"Plug 'mattn/emmet-vim',{ 'for': [ 'html','htmldjango'] }
Plug 'preservim/tagbar',{ 'on': ['TagbarToggle'] }
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'joshdick/onedark.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets', { 'on': [] }
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] }

" 500 毫秒后调用 LoadPlug，且只调用一次, 见 `:h timer_start()`
call timer_start(200, 'LoadPlug')
function! LoadPlug(timer) abort
  " 手动加载插件
  call plug#load('YouCompleteMe')
  call plug#load('vim-snippets')
  call plug#load('ultisnips')
endfunction

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
" 开启快捷键
map <F3> :call NerdTree()<CR>
function! NerdTree()
    silent NERDTreeToggle
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif  " Open NERDTree on each new tab.
endfunction
" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1     "显示隐藏文件
" 高亮文件和文件夹
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
"let g:NERDTreeDirArrowExpandable = ' '     "树的显示图标
"let g:NERDTreeDirArrowCollapsible = ' '
"let g:NERDTreeShowLineNumbers=1  " 显示行号
let g:NERDTreeWinSize=24    " window size
"Delete help information at the top
let NERDTreeMinimalUI=1

"let NERDTreeAutoCenter=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示文件夹打开图标
let g:DevIconsEnableFoldersOpenClose = 1

" emmet-vim
"let g:user_emmet_leader_key='<C-Z>'     " 设置快捷键

" auto-pairs
au FileType vim let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'","`":"`", '```':'```', '"""':'"""', "'''":"'''"} " Disable auto close quote in .vim
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--':'-->'})
" 防止与YCM的 Enter 键有冲突
let g:ycm_key_list_stop_completion = ['<s-cr>']  " YCM 回车即选中当前项
let g:AutoPairsMapCR = 0
function! Ycm_and_AutoPair_Return()
  if expand('<cword>') == '{}'
    return "\<CR>"
  else
    exe 'return '. substitute(substitute(execute('imap <s-cr>'),'^.*<SNR>','<SNR>', ''),'S-CR','CR','')
  endif
endfunction

inoremap <silent><cr> <c-r>=Ycm_and_AutoPair_Return()<cr><c-r>=AutoPairsReturn()<cr>

" YCM
" 跳转到定义处,Ctrl+j
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
"youcompleteme  默认tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"let g:ycm_key_invoke_completion = '<M-;>'
" 关闭错误诊断
"let g:ycm_show_diagnostics_ui = 0
" 警告和错误
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 关闭C#服务
let g:ycm_auto_start_csharp_server = 0
" 禁用/开启clangd
let g:ycm_use_clangd = 1
" 自动关闭下方函数预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 文件白名单
"let g:ycm_filetype_whitelist = {
"            \ "python":1,
"            \ "javascript":1,
"            \ "typescript":1,
"            \ "css":1,
"            \ "html":1,
"            \ }
" 文件黑名单
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'text' : 1,
      \ 'vim' : 1,
      \ 'go' : 1
      \}
let g:ycm_cache_omnifunc=0        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_disable_for_files_larger_than_kb = 3000    " YCM服务开启最大文件限制
" 函数原型，leader键=“\”
let g:ycm_auto_hover = ''
nmap <leader>d <plug>(YCMHover)

" indentLine
let g:indentLine_char_list = ['▏']
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_fileTypeExclude = ['startify']
" 让json文件正常显示引号
let g:vim_json_conceal=0

" tagbar
let g:tagbar_width = 30
nmap <F8> :TagbarToggle<CR>

" lightline
set guioptions-=e
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component': {
      \   'lineinfo': "%{line('.') . '/' . line('$')}",
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}'
      \ }
      \ }

" onedark
colorscheme onedark
if (has("termguicolors"))
    set termguicolors
endif

