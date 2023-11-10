highlight CodiVirtualText guifg=red

let g:codi#virtual_text_prefix = "❯ "

let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }

let g:codi#interpreters = {
   \ 'python': {
      \ 'bin': 'python3',
      \ 'prompt': '^\(>>>\|\.\.\.\) ',
    \ },
   \ 'java': {
      \ 'bin': 'jshell',
      \ 'prompt': '\(jshell> \)',
   \ },
   \ 'scala': {
      \ 'bin': ['scala', '-Dscala.color=false'], 
      \ 'prompt': '\(jshell> \)',
   \ }
\ }

" java and scala not work yet 
