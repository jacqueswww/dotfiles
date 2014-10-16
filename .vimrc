set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" HOWTO:
" $ git clone https://github.com/gmarik/Vundle.vim.git
" destination: ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"" Plugins and bundles
Plugin 'gmarik/Vundle.vim'
Bundle 'bling/vim-airline'
Bundle 'pangloss/vim-javascript'
Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'hdima/python-syntax'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/DeleteTrailingWhitespace'
Bundle 'tpope/vim-markdown'
Bundle 'ap/vim-css-color'
Bundle 'oblitum/rainbow'
Bundle 'junegunn/goyo.vim'
Bundle 'mattn/gist-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/csapprox'
Plugin 'klen/python-mode'

" themes
Bundle 'nanotech/jellybeans.vim'
Bundle 'cuviper/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'mattsacks/vim-eddie'

"" vim-airline settings
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

"" custom settings
filetype plugin indent on
syntax on

" python settings
let python_version_2=1
let python_highlight_all=1
let g:pymode_options_max_line_length = 99
let g:pymode_trim_whitespaces = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_indent = 1
let g:pymode_rope = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1

set hidden
set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set laststatus=2
set t_Co=256
set cursorline
set colorcolumn=100
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cinkeys=0{,0},:,0#,!,!^F
set mouse=a
set encoding=utf-8
set nopaste
set nofoldenable    " disable folding

if &t_Co >= 256 || has("gui_running")
    if has("gui_running")
        set guifont=Source\ Code\ Pro\ Light:h12
        set columns=999
        set linespace=1
        set go-=r
        set go-=L
        set go-=T
    endif
    "let g:solarized_base16=1
    "let g:solarized_termcolors=256
    colorscheme base16-default
endif


" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Toggle mouse and numbers
nnoremap <F5> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    set nonumber
    echo "Mouse usage disabled"
  else
    set mouse=a
    set number
    echo "Mouse usage enabled"
  endif
endfunction

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc
nnoremap <F8> :call SynStack()<CR>

" Sidebar explorer configs
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle=3
let g:netrw_list_hide = "\.pyc,\.swp,\.bak,\.git"
let g:netrw_special_syntax = 1
let g:netrw_liststyle = 1

" Rainbow configs
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['cyan', 'yellow', 'red', 'magenta']
function! ToggleRainbow()
    call rainbow#toggle()
endfunction
nnoremap <F7> :call ToggleRainbow()<CR>

" vim-pencil settings
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
autocmd FileType txt,text,markdown,mkd,md call SetTextSettings() 
function! SetTextSettings()
    set nofoldenable wrap linebreak nolist tw=79 colorcolumn=80
endfunction
