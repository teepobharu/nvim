
	" Solarized Theme
    " Test change submodule
	" Theme Configuration
	syntax enable
	" Set default theme

    " CTRL SPACE: Navigate around tabs/buffer/workspace
        " LINK: https://github.com/vim-ctrlspace/vim-ctrlspace
            Plug 'vim-ctrlspace/vim-ctrlspace'
                "Required for Plugin
               
                " set showtabline=0
                " REQUIRE SPACE AFTER mapping key <C-space> 
                let g:CtrlSpaceDefaultMappingKey = "<C-space> " 
                nnoremap <C-space> :CtrlSpace<CR> 
	" VIMAIRLINE: Use tab previw panel for git changes
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " TABS: Setting 
            let g:airline_theme='simple'
            
    " OmniSharp: Compiler 
        Plug 'OmniSharp/omnisharp-vim'
        let g:OmniSharp_server_stdio = 1
        let g:OmniSharp_highlight_types=2
        " CONFIG BY DOCS
        " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
            "Default = ''
           
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
    
    " INITIAL RECOMMEND:
        " Use release branch (Recommend)
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " Syntastic is a syntax checking plugin for Vim created by Martin Grenfell
        Plug 'scrooloose/syntastic'
        " Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
        Plug 'w0rp/ale'
        " List ends here. Plugins become visible to Vim after this call.
        Plug 'scrooloose/nerdtree'
            "Mapping for Plugin
            let NERDTreeQuitOnOpen = 1
            let NERDTreeShowBookmarks=1
            nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
            "
    " Tmux vim switch integration
        Plug 'christoomey/vim-tmux-navigator'
       
     " Github diff tool
         Plug 'tpope/vim-fugitive'
      
    " FZF: and vim integration
        source ~/.config/nvim/plug-config/fzf.vim
        
call plug#end()

" KEYMAP
    " Line Text edit
    inoremap <A-j> <Esc>:m .+2<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
"     nnoremap <Esc>j :m -1<CR>
"     nnoremap <Esc>k :m +1<CR>
"             nnoremap <A-k> :m .-1<CR>==
            "     Key Issues
"             nnoremap <A-j> :m .+1<CR>==
"             vnoremap <Tab>k :m '<-2<CR>gv=gv
"             vnoremap <Tab>j :m '>+1<CR>gv=gv
   " Resize window using arrow 
           nnoremap <Up> :resize +10 <CR>
           nnoremap <Down> :resize -10 <CR>
           nnoremap <Left> :vertical resize +10 <CR>
           nnoremap <Right> :vertical resize -11 <CR>
    " Navigate though projects
        nnoremap <C-]> :call SetProjectRoot()<CR>
        nnoremap <C-[> :lcd %:p:h<CR>
        nnoremap <C-leader> :lcd %:p:h | sp | terminal 
" Function
   " set working directory to git project root
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
   
