let mapleader = '='

call plug#begin('~/.vim/plugged')

"====================代码补全插件==================================================

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
set updatetime=300

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap cc :CocList commands<CR>

" K显示预览
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
"   'go'         : ['gofmt', 'goimports'],
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1

let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1

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
\	'java'       : ['javac'],
\}

"跳转错误
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"=====================nerdtree======================================================
Plug 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
nmap <leader>n :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"最后自动关闭nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd vimenter * NERDTree
"打开文本自动跳转工作区
" autocmd VimEnter * wincmd w

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

"====================debug===========================================================
"调试代码
" Plug 'vim-vdebug/vdebug'
let g:vdebug_options = {
\    'port' : 9000,
\    'timeout' : 20,
\    'server' : '',
\    'on_close' : 'stop',
\    'break_on_open' : 1,
\    'ide_key' : 'air',
\    'debug_window_level' : 0,
\    'debug_file_level' : 0,
\    'debug_file' : '',
\    'path_maps' : {'/var/www/html': '/Users/zhaobo/docker/nginx-php/html'},
\    'watch_window_style' : 'expanded',
\    'marker_default' : '⬦',
\    'marker_closed_tree' : '▸',
\    'marker_open_tree' : '▾',
\    'sign_breakpoint' : '▷',
\    'sign_current' : '▶',
\    'continuous_mode'  : 1,
\    'simplified_status': 1,
\    'layout': 'vertical',
\}
" let g:vdebug_options = {'ide_key': 'webs'}
" let g:vdebug_options = {'break_on_open': 0}
" let g:vdebug_options = {'server': 'dev_asset_api.ihibuilding.cn'}
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

"====================markdown=======================================================

" 语法高亮插件
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" markdown预览
Plug 'suan/vim-instant-markdown'
let g:vim_markdown_conceal = 0


"====================vue============================================================

Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
" autocmd  BufRead,BufNewFile  *.vue setlocal  filetype = vue.html.javascript.css
Plug 'neoclide/coc.nvim', {'branch': 'release'}



"====================tool===========================================================

"主题
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

"显示缩进
Plug 'yggdroot/indentline'

" If installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nmap <leader>f :Files<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>s :Ag<CR>


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

" 高亮下划线单词
Plug 'itchyny/vim-cursorword'

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
" yss'		整行添加'
" ys<n>w'	到第n个单词添加'
" cs'"		替换最近的'为"
" ds"		删除最近的"

"删除缓存buffer
Plug 'arithran/vim-delete-hidden-buffers'
":DeleteHiddenBuffers 删除其他所有buffer

" 打开文件跳转上次关闭位置
Plug 'farmergreg/vim-lastplace'

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

Plug 'mbbill/undotree'
nmap <leader>u :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif


call plug#end()


"====================基础配置========================================================
set shell=/bin/sh
set encoding=utf-8
filetype plugin indent on
set completeopt-=preview
set t_Co=256
set fileformat=unix            " 设置unix符号
syntax enable                  " 语法高亮
set number                     " 添加行号
set relativenumber             " 相对行号
set guifont=NewYork\ 12        " 设置字体
set autoread                   " 文件修改之后自动读入
set nobackup                   " 设置取消备份，禁止临时文件生成
set noswapfile                 " 设置取消备份，禁止临时文件生成
set showmode                   " 左下角显示当前Vim模式
set showmatch                  " 设置代码匹配,包括括号匹配情况
set tabstop=4                  " 设置tab4个空格
set autoindent                 " 自动对齐
set shiftwidth=4               " 4
set softtabstop=4              " 4
set backspace=indent,eol,start " 重置删除键
set lazyredraw                 " 懒加载
set textwidth=120              " 每行80字符
set wrap                       " 自动折行
set nospell                    " 关闭拼写检查
set nojoinspaces
set nofoldenable
set regexpengine=1
colorscheme molokai             " more颜色
hi Normal ctermfg=252 ctermbg=none

" 快捷键定义
nmap <leader>r :source ~/.vimrc<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <S-tab> <c-x><c-]>

imap <C-W> <Esc>:w<CR>
" buffer快捷键
nmap dn :bn<CR>:bd#<CR>
nmap db :bp<CR>:bd#<CR>
nmap <space>b :bp<CR>
nmap <space>n :bn<CR>
nmap <space>v <C-W>h
nmap <space>m <C-W>l
nmap <space>o :normal @o<CR>
nmap <leader>e <Plug>(coc-translator-e)
nmap gc <Plug>(coc-git-commit)
nmap <leader><Space> :StripWhitespace<CR>
nmap <leader>t :CocCommand template.templateTop<CR>
" 驼峰和下划线自动转化
nmap <leader>pp <ESC>:s/\([a-z]\)_\([a-z]\)/\1\U\2/g<CR>
nmap <leader>uu <ESC>:s/\([a-z]\)\([A-Z]\)/\1_\u\2/g<CR>

" 禁用vim方向键
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" 重置<Esc> <Enter>
inoremap ii <Esc>
inoremap kk <CR>
nnoremap H ^
nnoremap L $
nnoremap ;h H
nnoremap ;l L
