" ======================================================================================================================
" Plugin Manager
" ======================================================================================================================
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#install_log_filename = expand('~/.cache/dein-last.log')
let g:dein#types#git#default_protocol = 'ssh'
"let g:dein#types#git#clone_depth = 1

if dein#load_state(expand('~/.cache/dein'))
    call dein#begin(expand('~/.cache/dein'))
    call dein#add('Shougo/dein.vim')

    " Essentials
    call dein#add('tpope/vim-repeat') " Repeat more
    call dein#add('tpope/vim-abolish') " Case insensitive replace, ... and other stuff
    call dein#add('tpope/vim-eunuch') " Commands like :Remove
    call dein#add('tpope/vim-sensible') " Better defaults
    call dein#add('tpope/vim-endwise') " Some completions for viml/zsh/...
    call dein#add('dietsche/vim-lastplace') " restore cursor position at start

    " Appearance
    call dein#add('morhetz/gruvbox')
    call dein#add('icymind/NeoSolarized')
    call dein#add('chriskempson/vim-tomorrow-theme')
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('mhinz/vim-startify') " better start screen with bookmarks and mru
    call dein#add('equalsraf/neovim-gui-shim') " for nvim-qt
    " call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('kshenoy/vim-signature') " Show marks

    " Completion
    call dein#add('Shougo/deoplete.nvim') " Completion
    call dein#add('Shougo/neco-vim') " vim completion
    call dein#add('wellle/tmux-complete.vim') " complete with words from other panes
    " call dein#add('ponko2/deoplete-fish')
    call dein#add('ujihisa/neco-look') " word complete from dictionaries 
    " call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': 'bash install.sh'})

    " Edit helpers
    call dein#add('editorconfig/editorconfig-vim') " Support for editorconfig
    call dein#add('matze/vim-move') " Move lines with <c-h> etc
    call dein#add('svermeulen/vim-easyclip')  " better copy-paste with dd, ss, and mm, etc
    call dein#add('itspriddle/vim-stripper', {'on_cmd' : 'Stripper'}) " Remove trailing whitespace
    call dein#add('christoomey/vim-titlecase') " switch titlecase with gt+movement
    call dein#add('tpope/vim-commentary') " Comment with gc
    call dein#add('tpope/vim-surround') " Delete, add and change surroundings
    call dein#add('wellle/targets.vim') " More text objects, eg fun args are textobjects and we can do cia
    call dein#add('michaeljsmith/vim-indent-object') " Indentation objects for targets
    call dein#add('junegunn/vim-easy-align') " Align on operators
    call dein#add('AndrewRadev/switch.vim') " Switch values like true/false with gs
    call dein#add('machakann/vim-swap') " swap arguments with g< and g>
    call dein#add('vim-scripts/ReplaceWithRegister') " replace motion with register using gr<motion>
    call dein#add('Shougo/neosnippet.vim') " Snippet engine
    call dein#add('Shougo/neosnippet-snippets', {'depends' : 'neosnippet.vim'}) " Snippets
    call dein#add('mhinz/vim-sayonara', { 'on_cmd' : 'Sayonara' })
    call dein#add('brooth/far.vim', {'on_cmd' : ['Far', 'FarDo', 'Farundo']}) " Find And Replace
    " call dein#add('w0rp/ale') " Linting

    " Git/version control support
    call dein#add('tpope/vim-fugitive') " git support
    call dein#add('tpope/vim-rhubarb')  " github support
    " call dein#add('mhinz/vim-signify') " Highlight changed lines
    call dein#add('airblade/vim-gitgutter') " Highlight changed lines
    call dein#add('junegunn/gv.vim', {'on_cmd' : 'GV'}) " git browser

    " Denite
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neomru.vim') " mru source for unite
    call dein#add('bfredl/nvim-miniyank') " Yankring + denite source

    " FZF
    " call dein#add('junegunn/fzf', { 'build': './install --64 --no-key-bindings --no-completion --no-update-rc --no-fish', 'merged': 0 })
    " call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

    " FS navigation
    call dein#add('justinmk/vim-dirvish')  " displays a very nice little filebrowser adhoc to open stuff
    call dein#add('justinmk/vim-gtfo')
    call dein#add('dbakker/vim-projectroot')

    " Languages
    call dein#add('jalvesaq/Nvim-R') ", {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']} )
    call dein#add('mllg/vim-devtools-plugin', {'on_ft' : ['r', 'rmd', 'rdoc', 'rnoweb'], 'on_path' : ['DESCRIPTION', 'NAMESPACE']})
    call dein#add('lervag/vimtex', {'on_ft' : ['tex', 'Rnw']})
    call dein#add('octol/vim-cpp-enhanced-highlight')
    call dein#add('keith/tmux.vim')
    call dein#add('dag/vim-fish')
    call dein#add('honza/dockerfile.vim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif


filetype plugin indent on
syntax on


" ======================================================================================================================
" Settings
" ======================================================================================================================
set cursorline
set synmaxcol=1024
set number
set norelativenumber
set showmode
set textwidth=999
set hidden
set autowriteall
set lazyredraw
set encoding=utf-8
set fileformats+=mac
set nrformats-=octal
set printoptions=paper:A4,number:y
set title
set undofile
set showmatch
set nojoinspaces
set virtualedit=block
set nostartofline
set shortmess=aIT
set mouse=a
set clipboard=unnamedplus
set conceallevel=0
set noautochdir
set shell=/bin/bash
set noswapfile   " i dont like recovering of swap files

" Timeout
set timeout
set timeoutlen=750

" Completion
set completeopt=longest,menuone
set wildmenu
set wildignore+=.git,.svn
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.o,*.lo,*.pdf

" Indent
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set shiftround
set smartindent
set cinkeys=0{,0},0),:,!^F,o,O,e
set wrap
set breakindent
inoremap # X<c-h>#

" Search
set inccommand=nosplit
set hlsearch
set smartcase
set ignorecase
set gdefault
set wrapscan
set magic

" Splits
set splitbelow
set splitright
set previewheight=25
set diffopt+=vertical

" Spelling
set spelllang=en,de
set spellsuggest=fast,20

" ======================================================================================================================
" Autocommands
" ======================================================================================================================
function! MakeSpellFiles()
    for d in glob('~/.config/nvim/spell/*.add', 1, 1)
        if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
            exec 'mkspell! ' . fnameescape(d)
        endif
    endfor
endfunction
augroup mkspellfiles
    autocmd!
    autocmd VimEnter * call MakeSpellFiles()
augroup END


function! <SID>AutoProjectRootCD()
    try
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        " Silently ignore invalid buffers
    endtry
endfunction
augroup projectroot
    autocmd!
    autocmd BufEnter * call <SID>AutoProjectRootCD()
augroup END


function! SetTermOptions()
    set nobuflisted
    setlocal scrollback=10000
    setlocal nonumber
    setlocal ft=rterminal   " set a nice filetype for the terminal, so we can act on it, eg with sayonara
    " disable buffer change in rterminal. that fucks the rterminal as we are now in another buffer where terminal should be 
    nnoremap <buffer> <s-left> <Nop>
    nnoremap <buffer> <s-right> <Nop>
    " disable buffer dirvish too
    nnoremap <buffer> - <Nop>
endfunction
augroup terminal_fixes
    autocmd TermOpen * call SetTermOptions()
augroup END

" ======================================================================================================================
" Mappings
" ======================================================================================================================
let mapleader = ','
let maplocalleader = 'ß'

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nmap K <nop>
inoremap <m-h> <left>
inoremap <m-l> <right>
vnoremap < <gv
vnoremap > >gv

nnoremap Y y$
nnoremap Q @q
vnoremap . :normal .<cr>

" Keep search matches in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz

" After block yank and paste, move cursor to the end of operated text
" Also, don't copy over-pasted text in visual mode
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Windows resizing using arrow keys
nnoremap <silent> <M-Left> :vertical resize -1<CR>
nnoremap <silent> <M-Right> :vertical resize +1<CR>
nnoremap <silent> <M-Up> :resize +1<CR>
nnoremap <silent> <M-Down> :resize -1<CR>

function s:UpdatePlugins()
    call delete(g:dein#install_log_filename)
    call dein#update()
endfunction
command Update call s:UpdatePlugins()

command Cleanup call map(dein#check_clean(), "delete(v:val, 'rf')")
command Print exec ':hardcopy >~/vimprint.ps'

nmap <F9> :Gstatus<cr>


" ======================================================================================================================
" Plugin Config
" ======================================================================================================================
if dein#tap('vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline_extensions = ['branch', 'tabline', 'quickfix', 'whitespace', 'wordcount']
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_highlighting_cache = 1
endif




if dein#tap('deoplete.nvim')
    call deoplete#custom#option('auto_complete_delay', 1000)
    set shortmess+=c
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    " let g:deoplete#_keyword_patterns = {'_' : '[a-zA-Z_ÄÖÜäöüß]\k*'}

    call deoplete#custom#option('omni_patterns', {
    \ 'r' : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*', '\h\w*\w*', '\h\w*(w*']
    \ })

    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"
endif

if dein#tap('LanguageClient-neovim')
    let g:LanguageClient_serverCommands = {
        \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
endif

if dein#tap('fzf.vim')
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction
    let g:fzf_action = { 'ctrl-q': function('s:build_quickfix_list') }

    nmap <silent> <c-o> :Files<cr>
    nmap <silent> <c-g> :Rg<cr>
    nmap <silent> <leader>b :Buffers<cr>
    nmap <silent> <c-t> :Tags<cr>
    nmap <silent> <leader>fw :call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1)<cr>

    " Disable fuzzy matching for grep
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                \   { 'options' : '--exact'},
                \   <bang>0)
endif

if dein#tap('denite.nvim')
    nmap <silent> <c-t> :<C-u>Denite file_rec<cr>
    nmap <silent> <c-o> :<C-u>DeniteProjectDir file_rec<cr>
    nmap <silent> <c-g> :<C-u>Denite grep<cr>
    nmap <silent> <leader>b :<C-u>Denite buffer<cr>
    nmap <silent> <leader>d :<C-u>Denite directory_rec<cr>
    nmap <silent> <leader>y :<C-u>Denite miniyank<cr>
    nmap <silent> <leader>m :<C-u>Denite file_mru<cr>
    nmap <silent> <leader>u :<C-u>Denite -resume<cr>
    nmap <silent> <leader>n :<C-u>Denite -resume -select=+1 -immediately<cr>
    nmap <silent> <leader>p :<C-u>Denite -resume -select=-1 -immediately<cr>
    nmap <silent> <leader>fw :<C-u>DeniteCursorWord grep<CR><CR><C-W><CR>

    call denite#custom#map('insert', '<down>', '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<up>', '<denite:move_to_previous_line>', 'noremap')
    "call denite#custom#option('default', 'statusline', 0)
    call denite#custom#source('grep', 'args', ['', '', '!']) " grep interactively
    call denite#custom#source('grep', 'sorters', []) " keep sort order of rg

    if executable('rg')
        call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts', ['--column', '--line-number', '--no-heading'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif
endif

if dein#tap('neosnippet.vim')
    let g:neosnippet#snippets_directory = expand('~/.config/nvim/neosnippets')
    if !exists('g:neosnippet#scope_aliases')
        let g:neosnippet#scope_aliases = {}
    endif
    let g:neosnippet#scope_aliases['rnoweb'] = 'rnoweb,tex'
    let g:neosnippet#scope_aliases['rmd'] = 'rmd,markdown'
endif

if dein#tap('Nvim-R')
    let R_rconsole_width = 57                 " ensure that we always getting a vertical split by using a low nr here 
    let R_min_editor_width = 18               " ensure that we always getting a vertical split by using a low nr here  
    let g:R_complete = 2                      " omni-completion : always include names of objects
    let g:R_assign =0                         " disable underscore replacement.
    let g:R_close_term = 1                    " Close terminal buffer after R quited 
    let g:R_in_buffer = 1                     " Run R in Vim/Neovim built in terminal emulator
    let g:rout_follow_colorscheme = 1         " R output is highlighted
    let g:R_nvimpager = "horizontal"          " Use Vim to see R documentation, 
    let g:R_openpdf = 0                       " Open PDF after processing rnoweb file
    let g:R_openhtml = 0                      " Open HTML after processing either Rrst or Rmd
    " let g:R_tmux_title = "automatic"        " seems not to exist anymore
    let R_hl_term = 1                         " Syntax highlight terminal as rout file type
    " let g:r_indent_align_args = 0           " seems not to exits anymore 
    " let g:tex_conceal = ""                  " seems not to exist anymore
    let R_synctex = 0                         " disable SyncTeX support
    let R_latexcmd = ['pdflatex']             " Command to run on .tex files
    let g:R_pdfviewer = 'okular'              " PDF viewer to open PDF documents
    vmap <LocalLeader><LocalLeader> <Plug>RDSendSelection
    nmap <LocalLeader><LocalLeader> <Plug>RDSendLine
endif

if dein#tap('switch.vim')
    let g:switch_custom_definitions = [['TRUE', 'FALSE']]
    let g:switch_mapping = ""
    nmap <silent> + :Switch<cr>
endif

if dein#tap('switch.vim')
    let g:EasyClipUseSubstituteDefaults = 1
endif

if dein#tap('vim-startify')
    let g:startify_bookmarks = [ {'n': '~/.config/nvim/init.vim'}, {'f': '~/.config/fish/config.fish'}, {'r': '~/.Rprofile'} ]
    let g:startify_change_to_dir = 0
endif

if dein#tap('vim-surround')
    " yank command surrounding, useful for tex and Rd -> ys[motion]c
    let g:surround_99 = "\\\1cmd\1{\r}"
endif

if dein#tap('vim-gtfo')
    let g:gtfo#terminals = { 'unix' : 'konsole --workdir' }
endif

if dein#tap('vim-projectroot')
    nnoremap <leader>cp :ProjectRootCD<cr>
    let g:rootmarkers = ['DESCRIPTION','.svn','.hg','.git']
endif

if dein#tap('vim-easy-align')
    vmap <Enter> <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-move')
    let g:move_map_keys = 0
    nmap <C-j> <Plug>MoveLineDown
    nmap <C-k> <Plug>MoveLineUp
    vmap <C-j> <Plug>MoveBlockDown
    vmap <C-k> <Plug>MoveBlockUp
endif

if dein#tap('ale')
    let g:ale_enabled = 0
endif

if dein#tap('vimtex')
    let g:tex_flavor = 'latex'
    let g:vimtex_compiler_progname = 'nvr'
endif

if dein#tap('nvim-miniyank')
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
    " map <leader>p <Plug>(miniyank-startput)
    " map <leader>P <Plug>(miniyank-startPut)
    nmap <c-n> <Plug>(miniyank-cycle)
endif

if dein#tap('far.vim')
    let g:far#window_layout = 'tab'
    let g:far#source = 'rg'

endif

if dein#tap('vim-gitgutter')
    set updatetime=100      " ensure that gitgutter updates quickly enough     
endif

if dein#tap('vim-sayonara')
    let g:sayonara_confirm_quit = 1   " make sayonare ask before it deletes the last buffer and quits vim 
    " if we are in the rterminal window, kill the buffer and the window
    let g:sayonara_filetypes = {
        \ 'rterminal': 'bdelete!',    
        \ }
endif

" ======================================================================================================================
" Colorscheme / Terminal
" ======================================================================================================================
set background=dark
set t_Co=256
if has("termguicolors")
    set termguicolors
endif

if !empty($KONSOLE_PROFILE_NAME)
    set guicursor=
endif

if dein#tap('gruvbox')
    colorscheme gruvbox
    hi! link rPreProc GruvboxBlue
    hi! link rFunction GruvboxAqua
    hi! link rCommentTodo GruvboxOrange
    hi! link rOperator GruvboxRed
    hi! link rLstElmt GruvboxPurple
    hi! link rOperator GruvBoxBlue
    hi! link rDelimiter GruvboxFg3
endif


" Arrow keys
" go to left/right buffer with shift-arrow
nmap <silent> <S-Left> :bp<CR>
nmap <silent> <S-Right> :bn<CR>
noremap <silent> <C-Left> :wincmd h<cr>
noremap <silent> <C-Right> :wincmd l<cr>
noremap <silent> <C-Up> :wincmd k<cr>
noremap <silent> <C-Down> :wincmd j<cr>
nnoremap <f1> <c-w>5<
nnoremap <f2> <c-w>5>

" map f1 to NOP so we dont display help
" nnoremap <f1> <esc>
" inoremap <f1> <esc>
" vnoremap <f1> <esc>

" let f2 + f3 do notrhing for now 
" nnoremap <f2> <esc>
" inoremap <f2> <esc>
" vnoremap <f2> <esc>
nnoremap <f3> <esc>
inoremap <f3> <esc>
vnoremap <f3> <esc>


" show git status
nnoremap <f5> :Gstatus<cr>
inoremap <f5> <nop>
vnoremap <f5> <nop>
" start r console"
nmap <f6> <Plug>RStart
inoremap <f6> <nop>
vnoremap <f6> <nop>
" source an R file
nnoremap <f7> :RSourceFile<cr>
inoremap <f7> <nop>
vnoremap <f7> <nop>

" toggle spellchecking
nnoremap <f9>  :setlocal spell!<cr>
" clear search results
nnoremap <f10> :noh<cr>
" display invible symbols
nnoremap <F11> :set list!<CR>
" toggle wrapping mode
nnoremap <F12> :set wrap!<CR>
" nnoremap <F12> :RainbowParenthesesToggle<cr>

" Other hotkeys
" CTRL-x to close buffer with sayonara!, keep the current window (as we have other stuff open and dont want to fuckup the layout)
" this is the default we basically apply to any open file
nnoremap <C-x> :Sayonara!<cr>
" shift-x to close buffer AND the window, if we want to change splits
" we shouldnt really need this, as this should nbe handled by our Sayonara dictionary 
nnoremap <s-x> :Sayonara<cr>
" Use CTRL-S for saving, also in insert mode, we always end in normal
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-C>:update<CR>
" Use CTRL-Q to exit completely 
noremap <C-Q> :q!<CR>
" vim-commentary
nmap <C-y> gccj
vmap <C-y> gc
" print
" nmap <silent> <localleader>p :hardcopy >~/.cache/vim/lastprint.ps<cr>:!xdg-open ~/.cache/vim/lastprint.ps &<cr>
" enter works in normal mode
" nnoremap <cr> i<Enter><Esc>
" ctrl-tab for omni completion
" inoremap <S-tab> <C-x><C-o>

augroup rnw_fix_spell
   autocmd!
   autocmd FileType rnoweb :syntax spell toplevel
augroup END


" command completion
" type prefix, then wait, select with arrow keys, then hit return
" how to trigger completion on key?
"
"
" search for files
" strg-o : search for file names recursively, under git project dir
" strg-t : search for file names recursively, under same dir as current buffer file
"
" search for words
" strg-g: search for words in files under current git project dir
" ,fw: search for word currently under cursor

" ,n : go to next match
" ,p : go to prev match
" ,u : display match list again
"
" search-replace in current buffer 
" (we also see what happens when we type the replace)
" %s/foo/bar                 " replace all foo to bar in all lines 
" '<,'>s/foo/bar             " replace foo to bar in all visually selected lines
" adding a /c asks us for confirm whether we wanna do the replace 
"
"
" search replace over files
" :Far pattern replacement r 
" :Fardo
"
" vim surround
" edit words wrt quotes or parentheses 
" eg we now have ci' -> change in <single quotes>; or yi'; or di'
" or yi( 
"
" CAPSLOCK: Escape, got to normal mode
"
" dirvish:
" - : open dirvish, go up one dir
" enter: open file in buffer
" q: exit dirvish
"
"
" R:
" \rp: print object
" \rs: str object
" \rh: help page of word
" \kr: render file
" \kp: knit2pdf
"
" :RLoadpackage : loads current package
" CTRL-] : go to definition of function under cursor
"
" fugitive
" Gread
" Gwrite
" Gcommit
" Gmove
" Git checkout
" Gblame
" <git aliases also work>

" Gitgutter
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hr <Plug>GitGutterRevertHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunkP
"
"
" spell checking
" f9: toggle it
" ]s: next error
" [s: prev error
" z=: correct with popupo list
" zg: add it to dict
"
"
" editing
" c%: change matching stuff, changes everyting until a "match" occurs so foooooo(blaaaaaaa)
"
"
" FRAGEN
"
" kommando für Far, um replace zu togglen in der preview?
" wie macht man far nur auf ein sbestimmtes verzeichnis?
" --> das rg bei far ausstellen, dann die far-docs lesen ob man trotzdem noch far recursive auf alle 
"  files im project root machen kann
"
" man braucht echt einen key um das autocomplete selber zu triggern. und in R werden namen aus der aktuellen date einfach nicht angezeigt
"
" mal vim bessere keys lernen. 
" - edit am ender der zeile
" - edit below
" - paste below 
" - edit an einer bestimmten stelle
"
"
" wie kann man die reihenfolge der buffer obven ändern
" --- > weiß michel auch nicht
"
" der R language server stürzt stzändig ab, dann blockt auch der editor
" LanguageClient proSegmentation fault (core dumped)  
" ---> erstmal ausmachen? update von vim?
"
" michel [5:41 PM]
" https://github.com/ryanoasis/nerd-fonts
" Ich benutze Hack"
" ---> irgendwie sehen die fonts nicht anders aus? ich kann aber auch keine probleme sehen? mal michel fragen?
"
" https://coderwall.com/p/crj69a/from-a-useless-git-diff-to-a-useful-one"

" fragen:
" wie renamed / moved man files schnell
"
" bessere gitgutter movenets next und prev setzen. mal gucken wo man sonst sowas noch hat ",n" usw
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunkP
"
" kann man irgendwie supper schnell einen git diff der aktuellen file sehen?
"
