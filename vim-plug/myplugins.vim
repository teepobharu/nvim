" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
call plug#begin('~/.vim/plugged')
" COLOR AND THEME SETTINGS
	set termguicolors
	" Solarized Theme
	" Theme Configuration
	syntax enable
	" Set default theme
	Plug 'altercation/vim-colors-solarized'
		" let g:solarized_termcolors=256
		" colorscheme solarized
	Plug 'chuling/vim-equinusocio-material'
		let g:equinusocio_material_darker = 1 "default 
		let g:equinusocio_material_hide_vertsplit = 1 " hide vert split 
		" colorscheme equinusocio_material
		 "this theme has a buildin lightline theme, you can turn it on
		 let g:lightline = {
		   \ 'colorscheme': 'equinusocio_material',
		     \ }
		color desert 
    " CTRL SPACE: Navigate around tabs/buffer/workspace
        " LINK: https://github.com/vim-ctrlspace/vim-ctrlspace
            Plug 'vim-ctrlspace/vim-ctrlspace'
           
	" VIMAIRLINE: Use tab previw panel for git changes
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        " TABS: Setting 
            let g:airline#extensions#tabline#enabled = 1 " Show buffers tab when no tab is opened
        " THEMES: https://github.com/vim-airline/vim-airline-themes/tree/master/autoload/airline/themes
            let g:airline_theme='simple'
            
    " OmniSharp: Compiler 
        Plug 'OmniSharp/omnisharp-vim'
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
    " Tmux vim switch integration
        Plug 'christoomey/vim-tmux-navigator'
     " Github diff tool
         Plug 'tpope/vim-fugitive'
    " FZF: and vim integration
        source ~/.config/nvim/plug-config/fzf.vim

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
