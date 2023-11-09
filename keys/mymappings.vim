" nnoremap <c-leader>r :so ~/.config/nvim/init.vim <CR>

" Editing =================
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" test://123
" test://123

" Remove current binding
    " unmap <C-i>
" Line Text edit

" move selection visual mode
nnoremap ; :
xnoremap <silent> <A-j> :m '>+1<CR>gv=gv
xnoremap <silent> <A-k> :m '<-2<CR>gv=gv

inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
"     nnoremap <Esc>j :m -1
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
"     nnoremap <Esc>k :m +1<CR>
"     nnoremap <A-k> :m .-1<CR>==

"     Key Issues
"        nnoremap <A-j> :m .+1<CR>==
"        vnoremap <Tab>k :m '<-2<CR>gv=gv
"        vnoremap <Tab>j :m '>+1<CR>gv=gv
" Resize window using arrow 
        nnoremap <Up> :resize +10 <CR>
        nnoremap <Down> :resize -10 <CR>
        nnoremap <Left> :vertical resize +10 <CR>
        nnoremap <Right> :vertical resize -11 <CR>
" Navigate though projects
 "   nnoremap <C-]> :call SetProjectRoot()<CR>
 "   nnoremap <C-[> :lcd %:p:h<CR>
 "   nnoremap <C-leader> :lcd %:p:h | sp | terminal <CR>
" Primgen ranger_map_keys
" - https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
nnoremap <silent> J mzJ`z
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

 " Directory
 " copy current dir
nnoremap <C-\> :let @+=@%<CR>


