" see :help :scriptencoding
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged

call plug#begin('~/.vim/plugged')
"====================代码补全插件==================================================

"Plug 'ervandew/supertab'
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" SnipMate 携带的四个插件
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'
"Plug 'honza/vim-snippets'

" EasyComplete 插件和 Dictionary 词表
"Plug 'jayli/vim-easycomplete'
"imap <Tab>   <Plug>EasyCompTabTrigger
"imap <S-Tab> <C-x><C-]>
"let g:pmenu_scheme = 'dark'

"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabRetainCompletionType=0

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1

"====================语法检测和代码格式化===========================================

Plug 'w0rp/ale'
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
"显示Linter名称,出错或警告等相关信息
let g:ale_list_window_size = 5
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"格式化
let g:ale_fixers = {
\   '*'          : ['remove_trailing_lines', 'trim_whitespace'],
\	'html'       : ['prettier'],
\	'css'        : ['prettier'],
\   'javascript' : ['eslint'],
\   'vue'        : ['eslint', 'prettier'],
\   'php'        : ['php_cs_fixer'],
\   'go'         : ['gofmt'],
\	'json'       : ['fixjson', 'prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1

"语法检测
let g:ale_linter_aliases = {
\	'vue': ['vue', 'javascript'],
\	'vim': ['vim', 'vimrc']
\}
let g:ale_linters = {
\	'html'       : ['HTMLHint', 'prettier'],
\	'css'        : ['prettier'],
\   'javascript' : ['eslint'],
\   'vue'        : ['prettier', 'vls'],
\   'php'        : ['php'],
\   'go'         : ['gofmt', 'bingo'],
\	'sh'         : ['shellcheck'],
\	'vim'        : ['vint'],
\	'json'       : ['prettier'],
\	'lua'        : ['luacheck'],
\	'java'       : ['javac'],
\}

"跳转错误
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

"=====================nerdtree======================================================
Plug 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
"let NERDTreeShowHidden=1
"nmap <F2> :NERDTreeToggle<CR>

augroup NERDTREE
	autocmd!
	"自动开启nerdtree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
	""最后自动关闭nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	autocmd vimenter * NERDTree
	"打开文本自动跳转工作区
	autocmd VimEnter * wincmd w
augroup END
"


"nerdtree-git显示文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?'
    \ }
let g:NERDTreeShowIgnoredStatus = 1

"==================vim-airlin=======================================================

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
"定义底部
" function! AirlineInit()
"     let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    " let g:airline_section_b = airline#section#create_left(['file'])
    " let g:airline_section_c = airline#section#create(['%{getcwd()}'])
" endfunction
" autocmd VimEnter * call AirlineInit()

"airline主题
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

"====================git提示=========================================================

" 侧边提示
Plug 'tpope/vim-fugitive'
" git包转
Plug 'airblade/vim-gitgutter'
" :Agit 查看历史
Plug 'cohama/agit.vim'

"Plug 'jaxbot/github-issues.vim'

"====================taglist=========================================================

"tanglsit
Plug 'majutsushi/tagbar'
let g:tagbar_width = 25
"nmap <F3> :TagbarToggle<CR>

"自动刷新tag
Plug 'craigemery/vim-autotag'
let g:autotagTagsFile='tags'

"====================clang===========================================================

Plug 'Shougo/deoplete-clangx'

"====================html============================================================

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"E 代表HTML标签
"E#id 代表标签E有id属性
"E.class 代表E有class属性
"E[attr=foo] 代表某个特定属性
"E{info} 代表标签E包含的内容是info
"E>N 代表N是E的子元素
"E+N 代表N是E的同级元素
"E^N 代表N是E的上级元素
"<C-y>,  开启

"====================css=============================================================

"css显示颜色
Plug 'ap/vim-css-color'

"====================js==============================================================

Plug 'carlitux/deoplete-ternjs'
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/lib/node_modules/tern/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#sort = 0
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

"====================java============================================================

Plug 'artur-shaik/vim-javacomplete2'

"====================json============================================================

Plug 'rhysd/fixjson'

"====================sh==============================================================

Plug 'mvdan/sh'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
let g:shfmt_fmt_on_save = 1

"====================python==========================================================

Plug 'zchee/deoplete-jedi'

"====================go==============================================================

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
augroup goshutcut
	au FileType go nmap <leader>r <Plug>(go-run)
	au FileType go nmap <leader>b <Plug>(go-build)
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>c <Plug>(go-coverage)
	au FileType go nmap <Leader>ds <Plug>(go-def-split)
	au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	au FileType go nmap <Leader>dt <Plug>(go-def-tab)
	au FileType go nmap <Leader>gd <Plug>(go-doc)
	au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	au FileType go nmap <Leader>i :GoImport
	au FileType go nmap <Leader>d :GoDrop
augroup END
let g:go_disable_autoinstall = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_bin_path = expand('/usr/local/go')
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Plug 'cespare/vim-golang'
"
"====================php=============================================================

"检测代码，格式化 psr2
Plug 'squizlabs/PHP_CodeSniffer'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:phpcd_autoload_path = '~/.vim/plugged/phpcd.vim/vendor/autoload.php'

"====================debug===========================================================
"调试代码
Plug 'vim-vdebug/vdebug'
let g:vdebug_options = {'ide_key': 'PHPSTORM'}
let g:vdebug_options = {'break_on_open': 0}
let g:vdebug_options = {'server': 'http://jw.com'}
let g:vdebug_options = {'port': '9001'}
"F2     step over
"F3     step into
"F4     step into
"F5     start/run (to next breakpoint/end of script)
"F6     stop debugging (kills script)
"F7     detach script from debugger
"F9     run to cursor
"F10    toggle line breakpoint
"F11    show context variables (e.g. after 'eval')
"F12    evaluate variable under cursor

"====================vim============================================================

"ale
Plug 'Kuniwak/vint'

"vim提示
Plug 'Shougo/neco-vim'

"====================vue============================================================

Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
" autocmd  BufRead,BufNewFile  *.vue setlocal  filetype = vue.html.javascript.css

"====================markdown=======================================================

"Plug 'DavidAnson/markdownlint'
"markdown自动浏览
"Plug 'plasticboy/vim-markdown'
"Plug 'kannokanno/previm'
"Plug 'tyru/open-browser.vim'
"augroup PrevimSettings
""	autocmd!
""	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END
"let g:previm_open_cmd = 'open -a Google\ Chrome'

"====================other langaure=================================================

Plug 'fszymanski/deoplete-emoji'
" call deoplete#custom#source('emoji', 'filetypes', ['javascript'])

"====================tool===========================================================

"主题
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

"显示缩进
Plug 'yggdroot/indentline'

"根据文件内容和文件名查找文件
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" <leder>f 开启搜索
" <C-J>    选择下一个
" <C-K>    选择上一个

"代码对齐插件
Plug 'godlygeek/tabular'
" :Tab/

"快速移动
"Plug 'unblevable/quick-scope'

"注释插件
 Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
"切换所选行的注释状态                             <leader><space>
"使用漂亮的块格式布局注释掉选定的行               <leader>cs

"自动生成括号 自动删除
Plug 'jiangmiao/auto-pairs'

"多光标编辑
Plug 'terryma/vim-multiple-cursors'
"<C-n> 启动/跳转下一个
"<C-x> 取消最后一个选中跳过下一个
"<C-p> 撤销最后一个选中

"删除缓存buffer
Plug 'arithran/vim-delete-hidden-buffers'
":DeleteHiddenBuffers 删除其他所有buffer

"平滑滚动
Plug 'yuttie/comfortable-motion.vim'

"vim启动页面修改
Plug 'mhinz/vim-startify'

"添加书签
Plug 'mattesgroeger/vim-bookmarks'
let g:bookmark_save_per_working_dir = 1
let g:bookmark_disable_ctrlp = 1
let g:bookmark_location_list = 1
"mm   :BookmarkToggle           添加/删除书签
"mi   :BookmarkAnnotate<TEXT>   添加/编辑/删除注释
"mn   :BookmarkNext             跳转下一个书签
"mp   :BookmarkPrev             跳转上一个书签
"ma   :BookmarkShowAll          显示书签列表
"mc   :BookmarkClear            删除当前缓冲区书签
"mx   :BookmarkClearAll         删除所有缓冲区书签
"mg   :BookmarkMoveToLine       书签移动


call plug#end()

"====================基础配置========================================================

set encoding=utf-8
filetype plugin indent on
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
if has('autocmd') && exists('+omnifunc')
    autocmd Filetype *
   \ if &omnifunc == "" |
   \   setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
 endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt-=preview
set t_Co=256
"set mouse=a                    " 启用鼠标
syntax enable                   " 语法高亮
set number                      " 添加行号
set relativenumber              " 相对行号
set guifont=Monaco\ 12          " 设置字体
filetype off                    " 检测文件类型
filetype plugin on              " 允许插件
set autoread                    " 文件修改之后自动读入
set nobackup                    " 设置取消备份，禁止临时文件生成
set noswapfile                  " 设置取消备份，禁止临时文件生成
set showmode                    " 左下角显示当前Vim模式
set showmatch                   " 设置代码匹配,包括括号匹配情况
set guioptions+=b               " 添加水平滚动条
set tabstop=4                   " 设置tab4个空格
set autoindent                  " 自动对齐
set shiftwidth=4                " 4
set softtabstop=4               " 4
colorscheme molokai             " more颜色
let mapleader = '='             " 设置leader键为=
set backspace=indent,eol,start  " 重置删除键
set lazyredraw                  " 懒加载

"====================常用快捷键=====================================================

inoremap <C-T> <Esc>:bn<CR>i
inoremap <C-E> <Esc>:bp<CR>i
nnoremap <leader>r :source ~/.vimrc<CR>

"====================自动生成文件前缀================================================

func SetTitle()
	if &filetype ==# 'sh'
		call setline(1, '#!/bin/sh')
		call setline(2, '######################################################')
		call setline(3, '# Create by VIM')
		call setline(4, '# Author: ache')
		call setline(5, '# Created Time : '.strftime('%c'))
		call setline(6, '# File Name: '.expand('%'))
		call setline(7, '# Description:')
		call setline(8, '######################################################')
		call setline(9, '')
	elseif &filetype ==# 'lua'
		call setline(1, '#!//usr/local/bin/lua')
		call setline(2, '--[[')
		call setline(3, 'Create by VIM')
		call setline(4, 'Author: ache')
		call setline(5, 'Created Time : '.strftime('%c'))
		call setline(6, 'File Name: '.expand('%'))
		call setline(7, 'Description:')
		call setline(8, '--]]')
		call setline(9, '')
	elseif &filetype ==# 'php'
		call setline(1, '<?php')
		call setline(2, '/**')
		call setline(3, ' * Created by VIM')
		call setline(4, ' * User: ache')
		call setline(5, ' * Date: '.strftime('%Y-%m-%d'))
		call setline(6, ' * Time: '.strftime('%H-%M'))
		call setline(7, ' * Description:')
		call setline(8, ' */')
		call setline(9, '')
	endif
	augroup NEWFILESTARTINBOTTOM
		autocmd!
		autocmd VimEnter * :$
	augroup END
endfun
augroup AUTOCMD
	autocmd!
	autocmd BufNewFile *.sh,*.php,*.lua exec ":call SetTitle()"
	autocmd VimEnter * :echo '老婆大人爱你，么么哒。（>^.^<）!'
augroup END
