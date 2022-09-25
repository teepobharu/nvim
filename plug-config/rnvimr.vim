" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" nmap <leader>r :RnvimrToggle<CR>

let g:rnvimr_ranger_cmd = [ 
    \ 'ranger', '--cmd="set column_ratios 1,1"' 
\ ]
            " \ --cmd="set draw_borders separators"'

" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': float2nr(round(0.6 * &columns)),
"             \ 'height': float2nr(round(0.6 * &lines)),
"             \ 'col': float2nr(round(0.2 * &columns)),
"             \ 'row': float2nr(round(0.2 * &lines)),
"             \ 'style': 'minimal' }

let g:rnvimr_presets = [
                                    \ {},
                                    \ {'width': 0.700, 'height': 0.700},
                                    \ {'width': 0.800, 'height': 0.800},
                                    \ {'width': 0.950, 'height': 0.950} ]
            " \ {'width': 0.200, 'height': 0.200}]
" \ {'width': 0.800, 'height': 0.800}]

    " Customize multiple preset layouts
    " '{}' represents initial layout
    let g:rnvimr_presets = [
                \ {'width': 0.600, 'height': 0.600},
                \ {},
                \ {'width': 0.800, 'height': 0.800},
                \ {'width': 0.950, 'height': 0.950},
                \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0},
                \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0.5},
                \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0},
                \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0.5},
                \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
                \ {'width': 0.500, 'height': 1.000, 'col': 0.5, 'row': 0},
                \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0},
                \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0.5}
                \ ]
