[[TestLink]]


| test    | test2 | test3 | test4 | this is s o great |
| ahahaha | hha   | hahah | ahhah | ahaha             |
https://mkaz.blog/working-with-vim/vimwiki/#:~:text=VimWiki%20is%20a%20powerful%20plugin,lists%20in%20any%20text%20editor.

# Rename Files using vim
Link: https://www.reddit.com/r/vim/comments/b14wef/bulk_renaming_with_rangervim_short_video_tutorial/

t

```
:r !ls foo
<C-v>Imv<Space><Esc>
Make another column with whatever changes you want to each existing filename (can use :s, etc and combine this step with step 2)
:w !sh
```
# List Items
 Ctrl-<space>  Add checkbox
 glp change level progress 

- [X]  Done

[=                                  <Plug>VimwikiGoToPrevSiblingHeader 3
]=                                  <Plug>VimwikiGoToNextSiblingHeader  
gl*                                 :VimwikiChangeSymbolTo *<CR>        
gl+                                 :VimwikiChangeSymbolTo +<CR>        
gl-                                 :VimwikiChangeSymbolTo -<CR>        
glh                                 <Plug>VimwikiDecreaseLvlSingleItem 
gll                                 <Plug>VimwikiIncreaseLvlSingleItem 
<Plug>VimwikiNormalizeLink          &@:VimwikiNormalizeLink 0<CR>       
<Space>w<Space>y                    <Plug>VimwikiMakeYesterdayDiaryNote 
gl1                                 :VimwikiChangeSymbolTo 1.<CR>      
glx                                 <Plug>VimwikiToggleRejectedListItem 
<Plug>VimwikiRenumberAllLists       &@:VimwikiRenumberAllLists<CR>      
<Plug>VimwikiDecrementListItem      &@:VimwikiDecrementListItem<CR>     
<Plug>VimwikiIncrementListItem      &@:VimwikiIncrementListItem<CR>     
<Plug>VimwikiDiaryGenerateLinks     & :VimwikiDiaryGenerateLinks<CR>    
<S-2-LeftMouse>                     <LeftMouse>:VimwikiSplitLink<CR>   
<C-2-LeftMouse>                     <LeftMouse>:VimwikiVSplitLink<CR>   
<Plug>VimwikiTableMoveColumnLeft    &@:VimwikiTableMoveColumnLeft<CR>   
<Plug>VimwikiTableMoveColumnRight   &@:VimwikiTableMoveColumnRight<CR>  
# NOT WORKING can run commands manually 
gL*                                 :VimwikiChangeSymbolInListTo *<CR>  
gL+                                 :VimwikiChangeSymbolInListTo +<CR>  
gL-                                 :VimwikiChangeSymbolInListTo -<CR>  
gL1                                 :VimwikiChangeSymbolInListTo 1.<CR>  
