"编码设置
set fileencodings=utf-8,gbk
set termencoding=utf-8
set encoding=utf-8

"常规设置
syntax on           "语法高亮
set nocompatible    "关闭vi兼容模式
set nu              "显示行号
set ruler           "打开状态栏标尺
set softtabstop=4   "退格键删除4个空格
set tabstop=4       "设置tab长度为 4
set nobackup        "覆盖文件不备份
set autochdir       "自动切换当前目录
set hlsearch        "搜索高亮
set magic           "设置魔术
set smartindent     "自动缩行
set backspace=indent,eol,start
set laststatus=2    "显示状态栏
set bg=dark         "暗色背景
set history=2000    "history存储容量
set t_ti= t_te=     "设置退出显示的内容
set autoindent

"突出显示
set cursorcolumn
set cursorline

"检测文件类型，采用不同的缩进格式
filetype on
filetype indent on
filetype plugin indent on   
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on

"备份设置
"set backup
"set backupext=.bak
"set backupdir=~/.bak/

"显示状态栏内容
set ruler
set showcmd
set showmode

"搜索显示
set showmatch
set hlsearch
set ignorecase

"取消方向键
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

"==========================================================="
"特殊设置
"==========================================================="
"python文件设置
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"脚本文件加入文件头
autocmd BufNewFile *.sh,*.py exec":call AutoSetFileHead()"
function! AutoSetFileHead()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
                call setline(1, "\#!/bin/bash")
        endif
        "如果文件类型为python
        if &filetype == 'python'
                call setline(1,"\#!/usr/bin/envpython")
                call append(1,"\#encoding:utf-8")
        endif
endfunc

"==========================================================="
"功能键设置
"==========================================================="
"<F1>帮助信息（默认设置）
"<F2>开关行号
nnoremap <F2> :call HideNumber()<CR>
"<F3>开关目录树
map <F3> :NERDTreeToggle<CR>
"设置<F4>保存文件
map <F4> :<ESC>:w<CR>



function! HideNumber()
        if(&relativenumber == &number)
                set relativenumber! number!
        elseif(&number)
                set number!
        else
                set relativenumber!
        endif
                set number?
endfunc



"==========================================================="
"插件设置
"==========================================================="
"pydiction 自动补全
"NERDTree  目录树
"Vundle    插件管理

"==========================================================="
" 设置pydiction
"==========================================================="
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict' 
"菜单高度
let g:pydiction_menu_height = 3


"==========================================================="
" 设置NerdTree
"==========================================================="
"设置目录树位置
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
"默认开启NERDTree
"autocmd VimEnter * NERDTree
"当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1

"==========================================================="
"Vundle插件管理
"==========================================================="
set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" 让vundle管理插件版本
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"
"
"
"
"
"
"
"所有插件需要在下面这行上面
"安装插件的方式可以使用本地、git及网络安装
"示例
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'tpope/vim-fugitive'
"重名插件
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()

