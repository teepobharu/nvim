" Plugins will be downloaded under the specified directory.
" " - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" Always source these
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/os-settings.vim
source $HOME/.config/nvim/general/myfunctions.vim
source $HOME/.config/nvim/keys/mymappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Source depending on if VSCode is our client
if exists('g:vscode')
    " VSCode extension
  source $HOME/.config/nvim/vscode/windows.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
else
  " ordinary neovim
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/onedark.vim
  source $HOME/.config/nvim/themes/airline.vim

  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/coc.vim

  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/nerd-commenter.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/vim-wiki.vim

  source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/goyo.vim
  source $HOME/.config/nvim/plug-config/vim-rooter.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/vista.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim

  " == My config ==
  "source $HOME/.config/nvim/plug-config/nerdtree.vim
  source $HOME/.config/nvim/plug-config/ctrlspace.vim
  " source $HOME/.config/nvim/plug-config/omnisharp.vim
  " HTML
  source $HOME/.config/nvim/plug-config/emmet-vim.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
endif

