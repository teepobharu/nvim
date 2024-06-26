" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
   autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'github/copilot.vim'
  " Change dates fast
  Plug 'tpope/vim-speeddating'
  " Convert binary, hex, etc..
  Plug 'glts/vim-radical'
  " Files
  Plug 'tpope/vim-eunuch'
  " Repeat stuff
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " Better Comments
  Plug 'tpope/vim-commentary'
  " Key for faster navigationns [q 
  Plug 'tpope/vim-unimpaired'
  " Plug 'preservim/nerdcommenter'
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'
  " auto set indent settings
  Plug 'tpope/vim-sleuth'

  if exists('g:vscode')
    " Easy motion for VSCode
    Plug 'asvetliakov/vim-easymotion'

  else
    " Text Navigation
    Plug 'justinmk/vim-sneak'
    " Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    " Add some color
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{' 
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    " Plug 'christianchiarulli/onedark.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'kaicataldo/material.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'tomasiser/vim-code-dark'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    " Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Git
    Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'idanarye/vim-merginal'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'stsewd/fzf-checkout.vim'
    " Terminal
    Plug 'voldikss/vim-floaterm'
    " Start Screen
    Plug 'mhinz/vim-startify'
    " Vista
    Plug 'liuchengxu/vista.vim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Zen mode
    Plug 'junegunn/goyo.vim'
    " Making stuff
    Plug 'neomake/neomake'
    " Snippets
      " Plug 'honza/vim-snippets' " Disable on 2023-05-19  coc-snippets already worked
      Plug 'mattn/emmet-vim'
    " Better Comments
    " Plug 'jbgutierrez/vim-better-comments'
    " Echo doc
    " Plug 'Shougo/echodoc.vim'
    " Interactive code
    " Plug 'ChristianChiarulli/codi.vim' " Not working anymore
    Plug 'metakirby5/codi.vim'
    " Vim Wiki
    Plug 'https://github.com/vimwiki/vimwiki.git'

    " == My extra ==
    " Buffer Management
    Plug 'vim-ctrlspace/vim-ctrlspace'
    " Omni sharp
    " Plug 'OmniSharp/omnisharp-vim
    " Plug 'scrooloose/nerdtree'
    Plug 'houtsnip/vim-emacscommandline'
    " Tmux vim switch integration
    Plug 'christoomey/vim-tmux-navigator'
    "HTML EMMET
    Plug 'mattn/emmet-vim'
    Plug 'AndrewRadev/tagalong.vim'
  endif


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
