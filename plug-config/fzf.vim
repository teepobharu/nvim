" This is the default extra key bindings
" - action in fzf window

" Helper function section ====
function! s:copy_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': function('s:copy_results') 
  \ }
": c-o copy file name


" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
"" Popupwindow
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
"" Not popup view see more on :help fzfS
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
let g:fzf_layout = {'down': '40%', 'window': 'enew' }
let g:fzf_layout = {'down': '40%' }

" see in .zshrc if needd ??

if $FZF_DEFAULT_OPTS == ""
    let $FZF_DEFAULT_OPTS = "
        \ --layout=reverse --inline-info
        \
        \ --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
        \ --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
        \ --prompt='@ ' --pointer='▶' --marker='✓'
        \ --bind 'ctrl-space:toggle-preview'
        \ --bind 'ctrl-a:select-all'
        \ --bind 'ctrl-x:deselect-all'
        \ --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
        \ --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
        \"
endif

" with display
let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . ' --preview-window=:nohidden'
" let $FZF_DEFAULT_OPTS = "--layout=reverse --inline-info
"         \ --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
"         \ --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
"         \ --prompt='@ ' --pointer='▶' --marker='✓'
"         \ --bind 'ctrl-space:toggle-preview'
"         \ --bind 'ctrl-a:select-all'
"         \ --bind 'ctrl-d:deselect-all'
"         \ --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
"         \ --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
"         \"
if $FZF_DEFAULT_COMMAND == ""
    let $FZF_DEFAULT_COMMAND="
          \ rg --files --hidden --glob '!.git/**'
          \"
        "-g '!{node_modules,.git}'
    let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
endif


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   "rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/**' ".shellescape(<q-args>), 1,

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Define a custom command to change directory to the selected directory
command! -nargs=* FZFCD call fzf#run({
  \ 'source': 'echo ".." && find . -type d -maxdepth 3 -print',
  \ 'options': '',
  \ 'dir': <q-args>,
  \ 'dir2': '..',
  \ 'down': '40%',
  \ 'sink': 'cd'
  \ })
" gen by GPT
  " \ 'source': 'find . -type d -maxdepth 2 -print0',
  " \ 'options': '--filter=*/* --preview "ls -la {}" --preview-window right:60% --bind ctrl-o:execute("cd {} && clear && ls -la")',

" Define a custom command to search for files and directories
command! -bang -nargs=* FZFFiles
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)
    " \ call fzf#run({
    " \ 'source': 'find . -type f -o -type d -maxdepth 1 -print0',
    " \ 'options': '--filter=*/*/ --filter=*.{txt,md,html} --preview "bat --style=numbers --color=always {}" --preview-window right:60%',
    " \ 'sink': 'e'
    " \ })

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

