if system('uname -r') =~ "Microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
elseif system('uname') =~ "darwin"
    luafile $HOME/.config/nvim/lua/plug-colorizer.lua
endif
