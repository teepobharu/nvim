" let g:loaded_copilot = 1 " set to 0 to do setup inside plugin/copilot.vim remap 
inoremap <script><silent><nowait><expr> <C-o> copilot#Accept()
imap <M-.> <Plug>(copilot-next)
imap <M-,> <Plug>(copilot-previous)
let g:copilot_no_tab_map = v:true
" unlet g:copilot_no_tab_map
function s:TestEcho()
  if get(g:, 'copilot_no_tab_map') || get(g:, 'copilot_no_maps')
    return
  endif
  echo "running tes,t echo " . "asdasdasds"
  let tab_map = maparg('<Tab>', 'i', 0, 1)

  echo 'tab map' 
  echo tab_map
  if !has_key(tab_map, 'rhs')
      echo "rhs none"
    imap <script><silent><nowait><expr> <Tab> copilot#Accept()
  elseif tab_map.rhs !~# 'copilot'
    if tab_map.expr
      let tab_fallback = '{ -> ' . tab_map.rhs . ' }'
      echo "if 1"
    else
      echo "if 2"
      let tab_fallback = substitute(json_encode(tab_map.rhs), '<', '\\<', 'g')
    endif
    echo "current" . tab_fallback
    let tab_fallback = substitute(tab_fallback, '<SID>', '<SNR>' . get(tab_map, 'sid') . '_', 'g')
    echo 'tab fallback' . tab_fallback
    if get(tab_map, 'noremap') || get(tab_map, 'script') || mapcheck('<Left>', 'i') || mapcheck('<Del>', 'i')
      exe 'imap <script><silent><nowait><expr> <Tab> copilot#Accept(' . tab_fallback . ')'
    else
      exe 'imap <silent><nowait><expr>         <Tab> copilot#Accept(' . tab_fallback . ')'
    endif
  endif
endfunction


function! s:Event(type) abort
  try
    call call('copilot#On' . a:type, [])
  catch
    call copilot#logger#Exception()
  endtry
endfunction

" Enable to debug
" call TestEcho()
delfunction s:TestEcho


