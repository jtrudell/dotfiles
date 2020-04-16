let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor

" JEN ADDITIONS

" show dotfiles
let NERDTreeShowHidden=1

" yank to mac clipboard
set clipboard=unnamed

" stop exiting vim when running a command with !
" I have no idea why this works
autocmd vimenter * let &shell='/bin/zsh -i'
