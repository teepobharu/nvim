# == Variables ==
# == Extension ==


# == Settings ==

" Act like VIMRC for NEON 
nnoremap <leader>r :so ~/.config/nvim/init.vim <CR>
:cd %:p:h "test comment

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

# == Keybindings ==


# == Function ==

"function Osc52Yank()
"    let buffer=system('base64 -w0', @0)
"    let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
"    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
"endfunction
"nnoremap <leader>y :call Osc52Yank()<CR>


# == Others ==
