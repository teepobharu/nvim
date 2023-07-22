" https://github.com/mattn/emmet-vim
let g:user_emmet_mode='a'    "only enable normal mode and visual functions.
let g:user_emmet_install_global = 1

" autocmd FileType html,css,tsx EmmetInstall

" TSX not working ?
" - visual select Surround with tag with S+t
" - vat aroudn tag select
" - c-y d = select tag
" Needs to enter Ctrl Y , to enable
let g:user_emmet_leader_key='<C-Y>'

let g:user_emmet_settings = {
  \ 'typescript' : {
  \     'extends' : 'jsx',
  \ },
  \}

