
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
set noundofile
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
"智能自动换行
set linebreak

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   外观                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number    "显示行号
" gvim设置
if has("gui_running")
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono\ 12      " 设置字体
    set lines=43 columns=92    " 放在这里防止造成终端界面混乱
    set cursorline    " 光标所在的当前行高亮
    " 主题
    "colorscheme flattened_dark
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
"set cursorline    " 光标所在的当前行高亮
"hi CursorLine cterm=NONE ctermbg=none
"hi CursorLineNR  cterm=none ctermbg=242
" StatusLine
"set statusline=%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
"set statusline+=%=%y%m%r%h%w\        "显示文件类型及文件状态
"set statusline+=%{&ff}\[%{&fenc}]\   "显示文件编码类型
"set statusline+=row:%l/%L,col:%c\    "显示光标所在行和列
"set statusline+=%3p%%\            "显示光标前文本所占总文本的比例

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   编辑                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a    "支持使用鼠标
set expandtab    "Tab 转为空格
set tabstop=4
set softtabstop=4       "回退的长度
set shiftwidth=4        "每一级缩进的长度
filetype indent on     "不同文件类型采用不同缩进
set autoindent     "按下回车键后，保持与上一行的缩进一致
"set smartindent     "智能缩进
"命令模式下，底部操作指令按下 Tab 键自动补全
"第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full
"set nowrap    "取消换行
syntax on    "语法高亮
" 跨行移动光标
"set whichwrap+=<,>,h,l
" 全选+复制
map <C-A> ggVG
map! <C-A> <Esc>ggVG
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVGY

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
"                              自定义函数                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编译运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'text'
        exec "silent !plantuml % -tpng"
    elseif &filetype == 'dot'
        exec "silent !dot % -T png -o %<.png"
    endif
endfunc

" GuiTabel for gvim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  "let wincount = tabpagewinnr(v:lnum, '$')
  "return label . '  [' . wincount . ']'
  return label
endfunction
set guitablabel=%{GuiTabLabel()}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   插件                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
" startify放在devicons前面以显示图标
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons', { 'on': ['NERDTreeToggle'] }
Plug 'mattn/emmet-vim',{ 'for': [ 'html','htmldjango'] }
Plug 'preservim/tagbar',{ 'on': ['TagbarToggle'] }
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
"Plug 'yegappan/taglist', { 'on': 'TlistToggle' }
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
let g:NERDTreeDirArrowExpandable = '📁'     "树的显示图标
let g:NERDTreeDirArrowCollapsible = '📂'
"let g:NERDTreeShowLineNumbers=1  " 显示行号
let g:NERDTreeWinSize=24    " window size
"Delete help information at the top
let NERDTreeMinimalUI=1

let NERDTreeAutoCenter=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" emmet-vim
"let g:user_emmet_leader_key='<C-E>'     " 设置快捷键
let g:user_emmet_leader_key='<leader>'     " 设置快捷键

" auto-pairs
"let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"',"`":"`", '```':'```', '"""':'"""', "'''":"'''",'<':'>'}
au FileType vim let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'","`":"`", '```':'```', '"""':'"""', "'''":"'''"} " Disable auto close quote in .vim
" 防止与YCM的 Enter 键有冲突
let g:AutoPairsMapCR = 0

" YCM
" 回车即选中当前项
let g:ycm_key_list_stop_completion = ['<enter>']        " stop list completion
" 跳转到定义处,Ctrl+j
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" 关闭错误诊断
let g:ycm_show_diagnostics_ui = 0
" 警告和错误
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 关闭C#服务
let g:ycm_auto_start_csharp_server = 0
" 禁用/开启clangd
let g:ycm_use_clangd = 1
" 自动关闭预览窗口
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
let g:indentLine_char = '|'
"let g:indentLine_conceallevel = 2   " 使插件正常运行
let g:indentLine_fileTypeExclude = ['startify']
"let g:indentLine_leadingSpaceEnabled = 0

" tagbar
let g:tagbar_width = 30
nmap <F8> :TagbarToggle<CR>

" lightline
let g:lightline = {
      \ 'component': {
      \   'lineinfo': "%{line('.') . '/' . line('$')}",
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}'
      \ },
      \ }
