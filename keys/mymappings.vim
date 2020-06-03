" nnoremap <c-leader>r :so ~/.config/nvim/init.vim <CR>

" Line Text edit
    inoremap <A-j> <Esc>:m .+2<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
"     nnoremap <Esc>j :m -1<CR>
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

