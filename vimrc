source $VIMRUNTIME/vimrc_example.vim

" The following things are added by me.
set nu
set smartindent
set autoread
set autowrite
"set autochdir
set wildmenu
set magic
set backupdir=~/.vim/.backup
set directory=~/.vim/.swap
set statusline=%F%(\ %m%r%h%w%)\ [%{&ff}]\ [%Y]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}%=[0x%B]\ [%l,%(%c%V%)]\ [%P]

set laststatus=2
set cindent
set noexpandtab
set smarttab
"set ofu=syntaxcomplete
set showmatch
set showfulltag
set wildmode=longest,full
set colorcolumn=+1,+2
set hidden
set nostartofline

set smartcase

if has("gui_running")
	set guifont=Ubuntu\ Mono\ derivative\ Powerline:h13
endif

" Fcitx
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
"autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()

" Pathogen
"call pathogen#infect()
"Helptags

" Vundle
" Move all bundles to another file.
source ~/.vim/bundle/vimfiles/bundles.vim

" Scheme
set background=dark
colorscheme solarized

" Remove unwanted spaces
augroup ditsing
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()

	" Use F4 to delete all trailing whitespaces
	nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
augroup END

"Taglist.vim
let Tlist_Auto_Highlighting_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 0
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Compart_Format = 1
let Tlist_WinWidth = 40
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <silent> <F5> : TlistToggle<CR>

" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplMapWindowNavVim = 1

highlight MBENormal guifg=LightBlue
highlight MBEChanged guifg=LightGreen
highlight MBEVisibleActive term=bold cterm=bold gui=bold guifg=Yellow
highlight MBEVisibleChangedActive term=bold cterm=bold gui=bold guifg=Red
highlight MBEVisibleNormal guifg=Orange
highlight MBEVisibleChanged guifg=White

" move between buffers.
noremap <F2> :bprev<CR>
noremap <F3> :bnext<CR>

" Flex
augroup ditsing
	autocmd BufRead,BufNewFile *.flex setlocal ft=lex
augroup END

" Vim airline
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols#branch = ''
let g:airline_symbols#readonly = ''
let g:airline_symbols#linenr = ''
let g:airline#extensions#branch#symbol = ''
let g:airline#extensions#readonly#symbol = ''
let g:airline_linecolumn_prefix = ''
let g:airline#extensions#branch#enabled = 1

" Only in Vim 7.3.74+
set clipboard=unnamedplus       " Yank to the X window clipboard

" YouCompleteMe Plugin
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" Save undo to file
set undodir=~/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000
