# vimrc

```vim
map键 设置为`=`可以按照自己习惯自己定义


"====================代码补全插件==================================================

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

coc系列插件安装以下 [coc插件](https://www.npmjs.com/search?q=coc&page=0&perPage=20)
- coc-css
- coc-emmet
- coc-go
- coc-gocode
- coc-html
- coc-java
- coc-json
- coc-lists
- coc-lua
- coc-phpls
- coc-post
- coc-python
- coc-template
- coc-translator
- coc-tsserver
- coc-vetur
- coc-yaml

"====================语法检测和代码格式化===========================================

Plug 'dense-analysis/ale'

"=====================nerdtree======================================================

" 文件树插件
Plug 'scrooloose/nerdtree'

" 文件高亮
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" nerdtree-git显示文件状态
Plug 'Xuyuanp/nerdtree-git-plugin'

" 添加文件图标
Plug 'ryanoasis/vim-devicons'

"==================vim-airlin=======================================================

Plug'vim-airline/vim-airline'

"airline主题

"====================git提示=========================================================

" 侧边提示
Plug 'tpope/vim-fugitive'

" git包装
Plug 'airblade/vim-gitgutter'

" :Agit 查看历史
Plug 'cohama/agit.vim'

"====================taglist=========================================================

" 变量方法树
Plug 'liuchengxu/vista.vim'

"====================debug===========================================================

" 调试代码
" Plug 'vim-vdebug/vdebug'

"====================markdown=======================================================

" 语法高亮插件
Plug 'plasticboy/vim-markdown'

" markdown预览
Plug "suan/vim-instant-markdown"

"====================tool===========================================================

"主题
Plug 'tomasr/molokai'

"显示缩进
Plug 'yggdroot/indentline'

" 搜索
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"代码对齐插件
Plug 'godlygeek/tabular'

"注释插件
Plug 'scrooloose/nerdcommenter'

"多光标编辑
Plug 'terryma/vim-multiple-cursors'

" 高亮下划线单词
" Plug 'itchyny/vim-cursorword'

"删除缓存buffer
Plug 'arithran/vim-delete-hidden-buffers'

"平滑滚动
Plug 'yuttie/comfortable-motion.vim'

"vim启动页面修改
Plug 'mhinz/vim-startify'

"添加书签
Plug 'mattesgroeger/vim-bookmarks'

Plug 'junegunn/limelight.vim'
" :Limelight 开启黑暗模式

" 快速移动
Plug 'easymotion/vim-easymotion'

" 选择替换
Plug 'lfv89/vim-interestingwords'

" 快速替换)]}'"
Plug 'tpope/vim-surround'

"删除缓存buffer
Plug 'arithran/vim-delete-hidden-buffers'

" 打开文件跳转上次关闭位置
Plug 'farmergreg/vim-lastplace'

" 删除空格
Plug 'ntpeters/vim-better-whitespace'

" 代码片段补全
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" 查看修改记录
Plug 'mbbill/undotree'

call plug#end()


"====================基础配置========================================================
set shell=/bin/sh
set encoding=utf-8
filetype plugin indent on
set completeopt-=preview
set t_Co=256
set vb t_vb=				   " 关闭提示声
colorscheme molokai            " more颜色
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
" 切换左右窗口
nmap <space>v <C-W>h
nmap <space>m <C-W>l

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
```
