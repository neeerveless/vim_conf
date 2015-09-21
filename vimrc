"カーソル列を表示
set cursorline
"カーソル行を表示
"  set cursorcolumn
"  set shortmess+=I
"  execute "set colorcolumn=" . join(range(81, 9999), ',')
 set colorcolumn=80
"行数表示
set number
set ruler
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"inoremap <Space>[ <ESC>
inoremap <silent> jj <ESC><Right>
nmap <C-L><C-U> :undolist<CR>
nmap <silent> mm :set paste!<CR><ESC>
nmap <silent> < <C-w><c-<>
nmap <silent> > <C-w><c->>
map ,ptv :! perltidy
noremap 0 $
noremap 1 <S-i><Right><ESC>
nnoremap <CR> A<CR><ESC>
nnoremap <Space> i<Space><Right><ESC>
nnoremap <S-c> 0i#<Down><ESC>
nnoremap <S-t> 0x<Down><ESC>
nnoremap <BS> X
inoremap <C-f> <C-x><C-o>
set wildmenu
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <C-p> :<C-u>Unite history/yank<CR>
if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  " set backup        " keep a backup file (restore to previous version)
  set undofile      " keep an undo file (undo changes after closing)
  set undodir=$HOME/.vim/undodir
endif
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
""inoremap { {}<LEFT>
""inoremap [ []<LEFT>
""inoremap ( ()<LEFT>
""inoremap < <><LEFT>
""inoremap " ""<LEFT>
""inoremap ' ''<LEFT>
""""""""""""""""""""""""""""""
"--------------------
" インデント関係
"--------------------
"タブの入力を半角スペースに置き換える
set expandtab
"画面上でタブ文字が占める幅
set tabstop=4
"自動インデントでずれる幅
set shiftwidth=4
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
"改行時に前の行のインデントを継続する
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"行頭でtabを押した時にいい感じになる
set smarttab
"コピペ用、階段状にインデントさせない
"set paste
"--------------------
" 色関係
"--------------------
"テーマを設定
" colorscheme desert
" colorscheme molokai
colorscheme vibrantink
" colorscheme rdark
"文法によって色を変える
syntax on
"色
set t_Co=256
"--------------------
" ステータスライン関係
"--------------------
"ステータスラインを常に表示
set laststatus=2
"ステータスラインにコマンドを表示
set showcmd
"set statusline+=%<%F
"モードを表示しない
"set noshowmode
"--------------------
" 強調関係
"--------------------
set showmatch
"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
if has('syntax')
  augroup HighlightSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight Spaces cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
    autocmd VimEnter,WinEnter * match Spaces /　\|\s\+$/
  augroup END
endif
"全角スペースをハイライト表示
set modeline
"--------------------
" 検索関係
"--------------------
"検索結果文字列のハイライト表示
set hlsearch
"検索結果のハイライトを消す
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
"gfコマンド ファイル検索の拡張子
set suffixesadd+=.rb
"--------------------
" 入力装置関係
"--------------------
"空白文字, 前の行の改行, 文字以外も削除可
set backspace=indent,eol,start
"左右のカーソル移動で行間移動可能
set whichwrap=b,s,h,l,<,>,[,]
"マウスを有効にする
nmap <Silent> mn :set mouse=a<CR>
nmap <Silent> mf :set mouse=h<CR>
set mouse=a
function! MouseOn ()
  set mouse=a
endfunction
function! MouseOff ()
  set mouse=h
endfunction
command! MouseOn  call MouseOn()
command! MouseOff call MouseOff()
" 折り畳み
set foldmethod=marker
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
"ウィンドウのタイトルにファイルパスを表示する
set title
" set guifont=Menlo:h18
