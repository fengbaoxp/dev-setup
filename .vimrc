" 作者:  Eugene Wang
" 版本:  0.0.1
" Email: fengbaoxp@gmail.com

"========================================="
"                 前置条件                "
"========================================="
set nocompatible				" 去除VI一致性，用Vundle管理插件必须
filetype off					" 关闭文件类型探测， 用Vundle管理插件必须

"安装 vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"========================================"
"             vundle 管理的插件          "
"========================================"
" 插件列表需要放在设置插件配置选项前，因为
" vundle只有看到Plugin命令后，才会将下载并
" 将插件所在的文件夹加入到runtimepath中。
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'

"========================================"
"               特殊设置                 "
"========================================"
" 启用文件类型探测，插件，缩排;
" 这个需要放在Plugin命令后
" filetype plugin indent on


"========================================"
"               基本配置                 "
"========================================"
" vim 自身命令行模式智能补全
set wildmenu

" 设置vim编码
set encoding=utf-8
set fileencoding=tuf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" 自动缩进，每个tab占四个字符，并且4个空格代替tab。
set smartindent
set tabstop=4                           " 设置编辑时制表符占用空格数
set shiftwidth=4                        " 设置格式化时制表符占用空格数
set expandtab                           " 将制表符扩展为空格
set softtabstop=4                       " 将连续的空格视为一个制表符
set shiftround                          " 缩进取整

" 初始窗口高、宽、位置
set lines=70
set columns=210
winpos 100 100
" 显示行号
set number
" 编辑过程中右下角显示行列信息
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 总显示状态栏                          
set laststatus=2
" 启用backspace删除字符功能，并且可以跨行。
set backspace=indent,eol,start
" 根据当前输入，增量匹配上下文帮助提示内容。
set completeopt+=longest
" 禁止折行
set nowrap

" 自定义快捷键
let mapleader=";"                       " 定义快捷键前缀，即<leader>
vnoremap    <leader>y "+y               " 定义系统剪贴板复制快捷键
nmap        <leader>p "+p               " 定义系统剪贴板粘贴快捷键


"========================================"
"               插件配置                 "
"========================================"
" color schema 配置
" colorscheme molokai

" airline插件配置
set laststatus=2                        " 状态栏一直显示
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
