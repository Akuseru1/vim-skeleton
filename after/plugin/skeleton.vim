" Location: after/plugin/skeleton.vim
" Author: Modified by Simon Rydell originally by Noah Frederick

if exists('g:after_plugin_skeleton')
  finish
endif
let g:after_plugin_skeleton = 1

" Check if coc_snippets is loaded
" this is slow, should find better way
  let l:extensionInfo = CocAction('extensionStats')
  let g:coc_snippets_installed = 0
  let g:coc_snippets_activated = 0
  for l:extension in l:extensionInfo
    if l:extension['id'] == 'coc-snippets' && l:extension['state'] == 'activated'
      let g:coc_snippets_installed = 1
      let g:coc_snippets_activated = 1
      break
if !(g:coc_snippets_installed || (has('python') && has('python3')))
  finish
endif

augroup plugin_vim_skeleton
  autocmd!
  " Try and expand a skeleton upon a new file
  autocmd BufNewFile * silent! call skeleton#insert_skeleton()
augroup END
