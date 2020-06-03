" ~/.config/nvim/init.vim
let mapleader = "."

filetype plugin indent on
set shell=/bin/zsh
syntax enable
"set noswapfile
set tabstop=4
set shiftwidth=4
set expandtab
" enter the current millenium
" Search down into all file into directories
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Directory configure
set autochdir
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp/
set foldcolumn=1 "Show fold column
" Explorer Directory
let g:netrw_banner=0         "Disable annoying banner
let g:netrw_browse_split=4   "Open in prior Window
let g:netrw_altv=1           "open slit to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide+=',\(^\|\s\s\)\zs\.\S\+'
set nocompatible
" Enable syntax and plugins (for netrw)
colorscheme slate "ls -l /usr/share/vim/vim*/colors/
filetype plugin on

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Session
vnoremap <C-c> :y+<CR>
map <F1> :mksession!~/.vimsession/
map <F4> :source ~/.vimsession/

map <F2> :mksession!~/.vimsession/vim_session <CR>
map <F3> :source ~/.vimsession/vim_session <CR> 
" Save Folds/View
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" COMMENT TOGGLE
" let b:comment_leader = '#'
autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
autocmd FileType nasm             let b:comment_leader = ';'

function! CommentLine()
    execute ':silent! s/^\(.*\)/' . b:comment_leader . ' \1/g'
endfunction

function! UncommentLine()
    execute ':silent! s/^' . b:comment_leader . ' //g'
 endfunction
map <C-S-l> :call CommentLine()<CR>
map <C-S-h> :call UncommentLine()<CR>

"function Osc52Yank()
"    let buffer=system('base64 -w0', @0)
"    let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
"    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
"endfunction
"nnoremap <leader>y :call Osc52Yank()<CR>

