" Customized
   " Git set working directory to git project root
   " or directory of current file if not git project
   function! SetProjectRoot()
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