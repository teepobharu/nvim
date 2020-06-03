let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types=2
" CONFIG BY DOCS
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    "Default = ''
    let g:OmniSharp_selector_ui = 'fzf'
    nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Start the omnisharp server for the current solution
    nnoremap <Leader>ss :OmniSharpStartServer<CR>
    nnoremap <Leader>sp :OmniSharpStopServer<CR>
augroup omnisharp_commands
        autocmd!
        " Show type information automatically when the cursor stops moving.
        " Note that the type is echoed to the Vim command line, and will overwrite
        " any other messages in this space including e.g. ALE linting messages.
        autocmd CursorHold *.cs OmniSharpTypeLookup

        " The following commands are contextual, based on the cursor position.
        autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

        " Finds members in the current buffer
        autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

        autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
        autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
        autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
        autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

        " Navigate up and down by method/property/field
        autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
        autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

        " Find all code errors/warnings for the current solution and populate the quickfix window
        autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
        " OmniSharpInstall / :OmniSharoStartServer
    augroup END