set nocp     		"make vim not in compatible mode

set nu                  "show line number

set history=50		" keep 50 lines of command line history

set incsearch		"do incremental searching

set nomousefocus 	"no mouse

set noswapfile		"no swapfile"

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch   	"high light search
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  
  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" set custom themes 
set t_Co=256
colorscheme molokai

" enter paste mode
set pastetoggle=<F7>

" set FileEncoding
set fileencodings=utf-8,gbk,ucs-bom,cp936,gb2312

" choose all, copy, paste
map <C-A> <Esc> ggvG 
map! <C-A> <Esc>ggVG
map <C-S-v>  "+pa<Esc>
map! <C-S-v> "+pa
map <C-S-c>  "+Y
map! <C-S-c> "+Y

" set gvim font 
set guifont=consolas\ 14

" compile and run
map <F5> :call CompileCode()<CR>
map <F6> :call RunCode()<CR>

" compile different source code
func! CompileCode()
        exec "w"
        if &filetype == "cpp"
		exec "!g++ % -o %<"
	elseif &filetype == "c"
		exec "!gcc % -o %<"
	elseif &filetype == "java"
		exec "!javac %<"
	else
		exec "!echo unSupport Type"
        endif
endfunc

" run different code
func! RunCode()
	if &filetype == "cpp"
		exec "!./%<"
	elseif &filetype == "c"
		exec "!./%<"
	elseif &filetype == "java"
		exec "!java %<"
	elseif &filetype == "python"
		exec "!python2 %"
	endif
endfunc

" add initial code
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"                                                                  
func SetTitle()
        if &filetype == 'python'
                call setline(1, "\#!/usr/bin/env")
                call setline(2, "\"\"\"")
                call setline(3, "\# Author: newSolar")
                call setline(4, "\# Created Time : ".strftime("%c"))
                call setline(5, "")
                call setline(6, "\# File Name: ".expand("%"))
                call setline(7, "\# Description:")
                call setline(8, "")
                call setline(9, "\"\"\"")
                call setline(10,"")
        endif
        if &filetype == 'java' || &filetype == 'cpp'
                call setline(1, "/*************************************************************************")
                call setline(2, "")
                call setline(3, "\       Author:            newSolar")
                call setline(4, "\       Created Time :     ".strftime("%c"))
                call setline(5, "")
                call setline(6, "\       File Name:         ".expand("%"))
                call setline(7, "\       Description:       new style, new life")
                call setline(8, "")
                call setline(9, " ************************************************************************/")
                call setline(10,"")
        endif
endfunc

