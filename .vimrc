"====================基础配置========================================================
set shell=/bin/sh
set encoding=utf-8
filetype plugin indent on
set completeopt-=preview
set t_Co=256
syntax enable                  " 语法高亮
set number                     " 添加行号
set relativenumber             " 相对行号
set guifont=Monaco\ 12         " 设置字体
filetype on                    " 检测文件类型
filetype plugin on             " 允许插件
set autoread                   " 文件修改之后自动读入
set nobackup                   " 设置取消备份，禁止临时文件生成
set noswapfile                 " 设置取消备份，禁止临时文件生成
set showmode                   " 左下角显示当前Vim模式
set showmatch                  " 设置代码匹配,包括括号匹配情况
set tabstop=4                  " 设置tab4个空格
set autoindent                 " 自动对齐
set shiftwidth=4               " 4
set softtabstop=4              " 4
let mapleader = '='            " 设置leader键为=
set backspace=indent,eol,start " 重置删除键
set lazyredraw                 " 懒加载
set textwidth=120              " 每行80字符
set wrap                       " 自动折行
set nospell                    " 关闭拼写检查
set nojoinspaces
set nofoldenable
set regexpengine=1

" 快捷键定义
nmap <leader>r :source ~/.vimrc<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q!<CR>
nmap <leader>w :w<CR>
imap <S-tab> <c-x><c-]>
nmap <c-e> :bp<CR>
nmap <c-r> :bn<CR>
nmap <C-h> <C-W>h
nmap <c-l> <C-W>l
nmap <Leader>e <Plug>(coc-translator-e)
nmap gc <Plug>(coc-git-commit)

call plug#begin('~/.vim/plugged')
"====================代码补全插件==================================================

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
set updatetime=300

"====================语法检测和代码格式化===========================================

Plug 'dense-analysis/ale'
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
"显示Linter名称,出错或警告等相关信息
let g:ale_list_window_size = 5
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'

"格式化
let g:ale_fixers = {
\   '*'          : ['remove_trailing_lines', 'trim_whitespace'],
\	'html'       : ['prettier'],
\	'css'        : ['prettier'],
\   'javascript' : ['eslint'],
\   'vue'        : ['eslint', 'prettier'],
\   'php'        : ['php_cs_fixer'],
\   'go'         : ['gofmt', 'goimports'],
\	'json'       : ['fixjson', 'prettier'],
\   'python'     : ['yapf'],
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
\	'sql'        : ['sqlint'],
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
nmap <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"最后自动关闭nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
"打开文本自动跳转工作区
autocmd VimEnter * wincmd w

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

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

Plug'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
"定义底部
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
	let g:airline_section_b = airline#section#create_left(['file'])
	let g:airline_section_c = airline#section#create(['%{getcwd()}'])
endfunction
autocmd VimEnter * call AirlineInit()

"airline主题
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
" Plug 'itchyny/lightline.vim'

"====================git提示=========================================================

" 侧边提示
Plug 'tpope/vim-fugitive'
" git包转
Plug 'airblade/vim-gitgutter'
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
" :Agit 查看历史
Plug 'cohama/agit.vim'

"Plug 'jaxbot/github-issues.vim'

"====================taglist=========================================================

"自动刷新tag
Plug 'craigemery/vim-autotag'
let g:autotagTagsFile='tags'

Plug 'liuchengxu/vista.vim'
map <leader>v :Vista!!<CR>

"====================json============================================================

Plug 'rhysd/fixjson'

"====================sh==============================================================

Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
let g:shfmt_fmt_on_save = 1

"====================go==============================================================

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" augroup goshutcut
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
" augroup END
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
let g:go_fmt_command = 'goimports'

Plug 'dgryski/vim-godef'
" Plug 'cespare/vim-config'
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"====================debug===========================================================
"调试代码
" Plug 'vim-vdebug/vdebug'
" let g:vdebug_options = {'ide_key': 'PHPSTORM'}
" let g:vdebug_options = {'break_on_open': 0}
" let g:vdebug_options = {'server': 'http://jw.com'}
" let g:vdebug_options = {'port': '9001'}
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

"====================vue============================================================

Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
" autocmd  BufRead,BufNewFile  *.vue setlocal  filetype = vue.html.javascript.css

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
noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>
let g:Lf_ReverseOrder = 1
" <leder>f 开启搜索
" <C-J>    选择下一个
" <C-K>    选择上一个

" If installed using Homebrew
Plug '/usr/local/opt/fzf'


"代码对齐插件
Plug 'godlygeek/tabular'
" :Tab/

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

Plug 'junegunn/limelight.vim'
" :Limelight 开启黑暗模式

Plug 'ryanoasis/vim-devicons'

Plug 'easymotion/vim-easymotion'
nmap tt <Plug>(easymotion-t2)

Plug 'lfv89/vim-interestingwords'
nnoremap <silent> <leader>a :call InterestingWords('n')<cr>
nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

Plug 'tpope/vim-surround'

"删除缓存buffer
Plug 'arithran/vim-delete-hidden-buffers'
":DeleteHiddenBuffers 删除其他所有buffer

Plug 'ntpeters/vim-better-whitespace'


" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

Plug 'sniphpets/sniphpets'

call plug#end()


"=====================自动生成头部信息===================================================
colorscheme molokai             " more颜色
nmap <F2> :call PRUN()<CR>
func! PRUN()
	" exec 'w'
	if &filetype ==# 'sh'
		:!time bash %
	elseif &filetype ==# 'python'
		exec '!time python3 %'
	elseif &filetype ==# 'php'
		exec '!time php %'
	elseif &filetype ==# 'go'
		exec '!time go run %'
	elseif &filetype ==# 'js'
		exec '!time node %'
	endif
endfun

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
endfun
augroup AUTOCMD
	autocmd!
	autocmd BufNewFile *.sh,*.php,*.lua exec ":call SetTitle()"
augroup END
