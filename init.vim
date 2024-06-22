" Plugins will be downloaded under the specified directory.
" " - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Troubleshoot guides
" 1. Plug Install everytime => missing plugin check and remove/update 
"    - See vim-plug.vim ( comment PLugin or remove disable function if do not want to keep plugin )
" 2. Broken font for the theme - change in iTerm2 to be hack-nred-font
" 3. coc-installs failed package.json corrupted inside $HOME/.config/coc/extensions

" Normal Keys
" - gx = go to link  
" - gf = go to file

" LSP Keys
" - K => show document
" - gd => go to definition
" - gr => go to reference
" -

" Debug
" - C-M-o : vim message output
" - :CocCommand workspace.showOutput

" Search & replace ====
" helpful keys: 
" > visual + // to  autoescape / for  in currnet selection
" non greedy example
" \c case insensitiveget_registers
" \C case sensitive
" very magic  
" -/\vHOME.{-}\/

" Always source these
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/os-settings.vim
source $HOME/.config/nvim/general/myfunctions.vim
source $HOME/.config/nvim/keys/mymappings.vim

source $HOME/.config/nvim/keys/which-key.vim " WHICH KEY SHORTCUT MAPPING

" Source depending on if VSCode is our client
if exists('g:vscode')
  echo "VSCode detected, sourcing VSCode specific settings."
  " -- see here : https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#affinity
  "  # - https://github.com/vscode-neovim/vscode-neovim/wiki/Plugins
  " nnoremap ? <Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>


    " VSCode extension
  source $HOME/.config/nvim/vscode/windows.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  let g:debug_editormode='vscode'
else
  let g:debug_editormode='neovim'
  " ordinary neovim
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/onedark.vim
  source $HOME/.config/nvim/themes/airline.vim

  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  " $HOME/.config/nvim/coc-settings.json
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/copilot.vim

  " source $HOME/.config/nvim/plug-config/rnvimr.vim
  " source $HOME/.config/nvim/plug-config/ranger.vim
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
  source $HOME/.config/nvim/plug-config/auto-pairs.vim
  source $HOME/.config/nvim/plug-config/commenter.vim

  " == My config ==
  "source $HOME/.config/nvim/plug-config/nerdtree.vim
  source $HOME/.config/nvim/plug-config/ctrlspace.vim
  " source $HOME/.config/nvim/plug-config/omnisharp.vim
  " HTML
  source $HOME/.config/nvim/plug-config/emmet-vim.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
endif

lua require('basic')

