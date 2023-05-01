set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

if !exists('g:vscode')
  syntax enable                           " Enables syntax highlighing
  set hidden                              " Required to keep multiple buffers open multiple buffers
  set nowrap                              " Display long lines as just one line
  set encoding=utf-8                      " The encoding displayed 
  set pumheight=10                        " Makes popup menu smaller
  set fileencoding=utf-8                  " The encoding written to file
  set ruler              			            " Show the cursor position all the time
  set cmdheight=2                         " More space for displaying messages
  set mouse=a                             " Enable your mouse
  set splitbelow                          " Horizontal splits will automatically be below
  set splitright                          " Vertical splits will automatically be to the right
  set t_Co=256                            " Support 256 colors
  set conceallevel=0                      " So that I can see `` in markdown files
  set tabstop=4                           " Insert 2 spaces for a tab
  set shiftwidth=4                        " Change the number of space characters inserted for indentation
  set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  set expandtab                           " Converts tabs to spaces
  set smartindent                         " Makes indenting smart
  set autoindent                          " Good auto indent
  set laststatus=2                        " Always display the status line
  set number                              " Line numbers
  set relativenumber
  set cursorline                          " Enable highlighting of the current line
  set background=dark                     " tell vim what the background color looks like
  set showtabline=2                       " Always show tabs 
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
  set nobackup                            " This is recommended by coc
  set nowritebackup                       " This is recommended by coc
  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  set updatetime=300                      " Faster completion
  set timeoutlen=100                      " By default timeoutlen is 1000 ms
  set clipboard=unnamed                   " Copy paste between vim and everything else
  " below not work on mac - changed since 21 Feb 2023
  " set clipboard=unnamedplus             " Copy paste between vim and everything else

  set incsearch
  set guifont=Hack\ Nerd\ Font
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set mmp=1300
  " set autochdir                           " Your working directory will always be the same as your working directory
  " set foldcolumn=2                        " Folding abilities

  " au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  
  " == My added configed ==
  set path+=**
  " Backup dir
  " set backupdir=.backup/,~/.backup/,/tmp//
  " set directory=.swp/,~/.swp/,/tmp//
  " set undodir=.undo/,~/.undo/,/tmp/
  if &compatible
  set nocompatible             
  endif
  " set wildmenu
  " set autochdir
	" set termguicolors
  " Extension Required
    set nocompatible
  set shell=/bin/zsh
  " You can't stop me
  cmap w!! w !sudo tee %
endif
