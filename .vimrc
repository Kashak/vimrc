" Установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set keymap=russian-jcukenwin
" По умолчанию - латинская раскладка
set iminsert=0
" По умолчанию - латинская раскладка при поиске
set imsearch=0

" Подсвечивать поиск
set hls
" Ширина текста 
set textwidth=80
" Привести концы строк в файле к виду unix
set fileformat=unix

" Размер табуляции
set tabstop=2
" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=2
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent

" Включаем нумерацию строк
set number

" Включаем подсветку синтаксиса
syntax enable

" Ставим цветовую схему
" https://github.com/sickill/vim-monokai
colorscheme monokai
" https://github.com/chriskempson/tomorrow-theme
colorscheme Tomorrow-Night-Eighties

" Включаем перенос строк
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

set wildmenu
set wcm=<Tab>
menu Exec.Ruby    :!clear;ruby % <CR>
map <F9> :emenu Exec.<Tab>

set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Назначаем для автодополнения Ctrl + Space
inoremap <C-@> <C-x><C-o>

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" https://github.com/scrooloose/nerdtree
" Использовать клавишу F2 для включения и отключения NERD Tree
map <F2> :NERDTreeToggle<CR>

set laststatus=2   " всегда показывать строку статуса
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

function! NERDTreeQuit()
  redir => buffersoutput
	silent buffers
  redir END
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0
					 
  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)
										  
    if (len(m) > 0)
	    if (m[2] =~ '..a..')
		    let windowfound = 1
	    endif
    endif
  endfor
																														 
  if (!windowfound)
    quitall
  endif
endfunction
																																				  
autocmd WinEnter * call NERDTreeQuit()
