" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
"" set mouse=a " on OSX press ALT and click
"" set bs=2 " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR> " Quit current window
"" noremap <Leader>E :qa!<CR> " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <c-J> <esc>:tabprevious<CR>
map <c-K> <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv " better indentation
"" vnoremap > >gv " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" " cd ~/.vim/bundle
" " git clone https://github.com/klen/python-mode
" "" map <Leader>g :call RopeGotoDefinition()<CR>
" "" let ropevim_enable_shortcuts = 1
" "" let g:pymode_rope_goto_def_newwin = "vnew"
" "" let g:pymode_rope_extended_complete = 1
" "" let g:pymode_breakpoint = 0
" Disable rope in pymode as we are going to use jedi_vim
let g:pymode_rope = 0
let g:pymode_syntax = 0
let g:pymode_python = 'python'
let g:pymode_lint = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_unmodified = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
" Ignore long line warning
let g:pymode_lint_ignore = "C0301,E501"
let g:pymode_virtualenv = 1
" Use jedi doc
let g:pymode_doc = 0
let g:pymode_run = 0
" let g:pymode_run_bind = '<leader>r'
map <Leader>d :! ../debug.sh<CR>
" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" let g:jedi#related_names_command = "<leader>z"
" let g:jedi#goto_command = "<leader>g"  
let g:jedi#auto_initialization = 1
let g:jedi#goto_definitions_command = "<c-g>" 
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:pymode_breakpoint = 0
noremap <Leader>b Oimport pudb; pudb.set_trace() # SET BREAKEPOINT<C-c>

noremap <Leader>t :!nosetests *.py --with-doctest --rednose -v --doctest-options=+NORMALIZE_WHITESPACE<CR>
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
set foldnestmax=2

" Copy/Past current word
noremap <leader>c :let @a=expand("<cword>")<CR>
noremap <leader>v "ap

" Set spellchecking to englisch
set spell spelllang=en
set sps=best,5
hi SpellBad cterm=undercurl ctermbg=0 ctermfg=red
hi SpellRar cterm=undercurl ctermbg=0 ctermfg=red
hi SpellCap cterm=undercurl ctermbg=0 ctermfg=red
map <leader>s :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR> 
