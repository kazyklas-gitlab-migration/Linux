"#############################
"# Creator: Tomas Klas
"# Date: 2019-03-01
"# Contact: tomas.klas@datamole.cz
"#############################

" Number of lines

set number

" Tab size
set tabstop=4
set shiftwidth=4
set expandtab

"set spell check for eng
" "set spell spelllang=en_us

" Finding files 
set path+=**

" Syntax enable
syntax enable
set nocompatible
filetype plugin indent on

" Python
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" C++ comments
set comments=sl:/*,mb:\ *,elx:\ */

" Doxygen comments
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" nice line 
set cursorline

" auto complete twin symbols
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap " ""<Esc>:let leavechar="""<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i



" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" smart TAB
set smarttab		"smart tab
set autoindent			"set auto indent
set smartindent			"set smart indent




" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer



" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags



" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" PLUGINS:

execute pathogen#infect()

let g:airline_theme='wombat'

colorscheme nord

