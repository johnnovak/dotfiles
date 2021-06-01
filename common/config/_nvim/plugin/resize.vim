fun! s:IsLeftEdgeWindow()
  let pos = win_screenpos(winnr())
  let col = pos[1]
  return col == 1
endfun

fun! s:IsTopEdgeWindow()
  let pos = win_screenpos(winnr())
  let row = pos[0]
  return row == 1
endfun

fun! s:IsRightEdgeWindow()
  return !s:IsLeftEdgeWindow() && winnr('l') == winnr()
endfun

fun! s:IsBottomEdgeWindow()
  return !s:IsTopEdgeWindow() && winnr('j') == winnr()
endfun


let s:commands = {
      \   'h': '<',
      \   'l': '>',
      \   'k': '-',
      \   'j': '+'
      \ }

let s:inverted_commands = {
      \   'h': 'l',
      \   'l': 'h',
      \   'k': 'j',
      \   'j': 'k'
      \ }

fun! s:ResizeWindow(dir, count = 1)
  let cmd = a:dir
  if     ((a:dir == 'h' || a:dir == 'l') && s:IsRightEdgeWindow())
    \ || ((a:dir == 'j' || a:dir == 'k') && s:IsBottomEdgeWindow())
    let cmd = s:inverted_commands[a:dir]
  endif

  exe a:count . 'wincmd ' . s:commands[cmd]
endfun

command! -nargs=+ ResizeWindow call s:ResizeWindow( <args>)

noremap <silent> <M-h> :ResizeWindow('h')<CR>
noremap <silent> <M-l> :ResizeWindow('l')<CR>
noremap <silent> <M-k> :ResizeWindow('k')<CR>
noremap <silent> <M-j> :ResizeWindow('j')<CR>

