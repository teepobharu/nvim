" Go to files
" Source Plugin files

" Go to files
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-x><C-o> :Buffers<CR>
" nnoremap <C-g> :Rg<Cr>
     
"Complete line in Buffer
imap <C-f>  <plug>(fzf-complete-line) 

"Complete path
imap <C-p> <plug>(fzf-complete-path) 	
" Path Complete with custom command
" Global line completion (not just open buffers. ripgrep required.)
" Directory (Path) Completion to get notePath from bashrc
" TODO SET var: 'dir': "$notePath"
nnoremap <silent> <C-x><C-p> :call fzf#run({'source': 'fd -t f','options': '--reverse --prompt "NotePath"', 'down': 20, 'dir': '~/Desktop/APersonal Info/Repo/mynotes', 'sink': 'e' })<CR>

inoremap <expr> <c-x><c-f> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..' }))

command! -bang -complete=dir -nargs=* FD call fzf#run(fzf#wrap({'source':'fd -t f -H', 'dir': <q-args>}))
command! -bang -complete=dir -nargs=* LS call fzf#run(fzf#wrap({'source':'fd -t d -H', 'dir': <q-args>}, <bang>0))
nnoremap <A-f> :FZF~<CR>

inoremap <expr> <C-x><C-b> fzf#vim#complete#path(-S)
