"---------------------------------------------------------------------
"aabccd021/dotfiles/.vimrc
"---------------------------------------------------------------------

"Vundle config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'
Plugin 'miyakogi/conoline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'airblade/vim-rooter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/terminus'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ

"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_classic'

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1

set clipboard=unnamedplus


set background=dark
syntax on
set noshowmode
set splitbelow
set splitright
"set paste
set ttimeoutlen=50

"NERDTree config
nmap <F2> :NERDTreeToggle<CR>
map <C-a> <esc>ggVG<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

"conoline config
let g:conoline_auto_enable = 1
"let g:conoline_use_colorscheme_default_normal=1
let g:conoline_color_insert_nr_dark = 'ctermbg=blue ctermfg=black'
let g:conoline_color_normal_nr_dark = 'ctermbg=green ctermfg=black'
let g:indent_guides_enable_on_vim_startup = 1

"indent guide config
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size= 1
let g:indentLine_char = '¦'

"autopep8 config
let g:autopep8_max_line_length=79

"ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.pdf,*.aux,*.zip,*.jpg,*.png,*.toc,*.out,*.log,*/Android,*/fonts    " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svni|Android)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"autocmd StdinReadPre * let s:std_in=1

function! MaybeCtrlP()
    if argc() == 0
        execute "CtrlPMRUFiles"
    endif
endfunction
autocmd VimEnter * :call MaybeCtrlP()

"supertab config
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabCrMapping=1
autocmd BufWritePre * :%s/\s\+$//e
set completeopt-=preview


"Vimux config
let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'

"syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers= ['pyflakes']

"let g:jedi#popup_on_dot = 0
"---------------------------------------------------------------------
"general setting
"---------------------------------------------------------------------
set history=10000
set number relativenumber
set showmatch
set autoindent smartindent
set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,],~
set noswapfile
set nobackup
set lazyredraw

"search setting
"---------------------------------------------------------------------
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

"display setting
"---------------------------------------------------------------------
hi CursorLine term=bold cterm=bold ctermbg=black guibg=Grey
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-twilight
"see this if had green or blue number row -->https://github.com/chriskempson/base16-shell

"key remap setting
"---------------------------------------------------------------------
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
nnoremap <Space> za
nnoremap cw ciw
map <F3> :tabnew <CR>
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
nmap <CR> o<Esc>k
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP


"---------------------------------------------------------------------
"key remap notes
"---------------------------------------------------------------------
"<Esc><Esc>;search highlight off
"<F2>;open new tab and browse file
"<F5>;compile and run

"---------------------------------------------------------------------
"auto reload .vimrc
"---------------------------------------------------------------------
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=manual
augroup END

"---------------------------------------------------------------------
"compile and run using F5
"---------------------------------------------------------------------
augroup CompileAndRun
  autocmd!
  autocmd FileType python nnoremap <buffer> <F5> :w<CR>:call VimuxRunCommandInDir('python3',1)<CR>
  autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:call VimuxRunCommandInDir('g++ -o main',1)<CR>:call VimuxRunCommandInDir('./main',0)<CR>

  autocmd FileType tex nnoremap <buffer> <F5> :w<CR>:call VimuxRunCommandInDir('pdflatex',1)<CR>
augroup END
"---------------------------------------------------------------------
"Python setup
"---------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
augroup pythonss
  autocmd!
  autocmd Filetype python setl autoindent expandtab
  autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4
augroup END




if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
