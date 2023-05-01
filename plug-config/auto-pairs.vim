let g:AutoPairsMoveCharacter = ''

" unlet g:AutoPairsLoaded " reset vim OG not exists 
function s:RemoveAutoPairsMoveKeyMap()
    " let l:array1 = [1, 2]
    " let l:array2 = ['a', 'b']
    " let l:result = map(l:array1, {_, v -> map(l:array2, {_, w -> v . w})})
    " echo flatten(l:result)
    let l:keys = ['[', ']', '(', ')', '}', '{', '"', "'"]
    let l:baseKey = ['M']

    " " let l:combinations = flatten(map(l:keys, {_, val -> map(l:baseKey, {_, base -> "<" . base . "-" . key . ">"})}))
    " " echo l:combinations
    " echo "11" . "asd" . "czx"
    " " let l:k =  maparg("<M-'>", 'i')

    for l:key in l:keys
        let l:keycheck = '<' . l:baseKey[0] . "-" . l:key . ">"
        " echo "checking key ... " . l:keycheck
        if mapcheck(l:keycheck, 'i') =~ 'AutoPairsMoveCharacter'
            echo l:keycheck . " : Find mapping with AutoPairs"
            let l:keyunbind = '<silent> <buffer> ' . l:keycheck
            " exe "inoremap " . l:keyunbind . " <Nop>"
            exe "iunmap " . l:keyunbind
        endif
    endfor

endfunction

call s:RemoveAutoPairsMoveKeyMap()

