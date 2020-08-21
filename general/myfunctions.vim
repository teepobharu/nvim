" Customized
function! SetProjectRoot()
   " Git set working directory to git project root
   " or directory of current file if not git project
   " default to the current file's directory
   lcd %:p:h
   let git_dir = system("git rev-parse --show-toplevel")
   " See if the command output starts with 'fatal' (if it does, not in a git repo)
   let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
   " if git project, change local directory to git project root
   if empty(is_not_git_dir)
       lcd `=git_dir`
   endif
endfunction
command! MYSetProjectRoot call SetProjectRoot()

"Delete all Git conflict markers
"Creates the command :GremoveConflictMarkers
function! RemoveConflictMarkers() range
  echom a:firstline.'-'.a:lastline
  execute a:firstline.','.a:lastline . ' g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d'
endfunction
"-range=% default is whole file
" set the command to be used visual select or can be used while resolve
command! -range=% GremoveConflictMarkers <line1>,<line2>call RemoveConflictMarkers()

function! PutFileName()
    :put =expand('%:t')
endfunction

function! RunPython()
       "without Press Enter prompt
       silent !clear
       " echom system("ls")
       " vsplit 
       " normal! ggVG
       :w
       :!echo "======== Run File << " %:t " >> =========="
       if executable("pipenv")
         :!echo "======== <<PIPENV>> =========="
         " use Python2 Fail to execute
         :!pipenv run python -V
         :!pipenv run python %
       elseif executable("python3")
         :!echo "======== <<PYTHON3>> =========="
         :echo "use Python 3"
         :!python3 %
       elseif executable("python")
         :!python %
       elseif executable("python2")
         :echo "Not Exists"
         :!python2 %
       else
         :echom "Python not exists"
       endif
endfunction
command! MYRunPython call RunPython()

function ViewDiff()
    silent !clear
    :w !diff % -
endfunction
command! MYViewDiff call ViewDiff()

function ResetVim()
    if confirm('ResetVim are you sure?', "&Yes\n&No", 1)==1
        exe "!ls" . expand("%:p")
        " :set all& | source $MYVIMRC
    endif
endfunction
command! MYResetVim call ResetVim()
