" => basics
" ---------

    " set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8

    " mouse support
    set mouse=nvi
    nmap , \

" => visuals
" ----------

    set t_Co=256

    set background=dark
    " set background=light

    set so=7
    set number relativenumber
    map <leader>n :set number! relativenumber!<cr>
    set statusline=%#LineNr#\ %=\ %F%m%r%h\ %w\ %l:%c\ %L
    highlight LineNr ctermfg=green

    set expandtab
    set shiftwidth=4
    set tabstop=4

    set laststatus=2

    set splitbelow
    set splitright

    set ignorecase
    set hlsearch
    set incsearch

    " turn off error sound
    set noeb vb t_vb=
    autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

" => utils
" --------

    map 0 ^
    set history=1000
    " spell checker
    map <leader>x :setlocal spell!<cr>

    " bash bindings
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>

    " quick save
    nmap <leader>w :w!<cr>

    " configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " move around
    nnoremap <C-k> <C-u>
    nnoremap <C-j> <C-d>
    nnoremap <space> <C-^>

    " utils
    vnoremap <C-c> :w !xclip -selection clipboard<CR><CR>
    nnoremap <leader>b :%w !xclip -selection clipboard<CR><CR>

    " system clipboard
    set clipboard=unnamed

" => plugins
" ----------
    call plug#begin('~/.vim/plugged')
        Plug 'NLKNguyen/papercolor-theme'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'preservim/nerdtree'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'jpalardy/vim-slime'
        Plug 'junegunn/goyo.vim'
        Plug 'pangloss/vim-javascript'
        Plug 'JuliaEditorSupport/julia-vim'
        Plug 'rust-lang/rust.vim'
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'Quramy/tsuquyomi'
        Plug 'dense-analysis/ale'

        " lsp
        Plug 'prabirshrestha/vim-lsp'
        Plug 'mattn/vim-lsp-settings'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'
    call plug#end()

    " colorscheme PaperColor

    " nerdtree
    let g:NERDTreeMinimalMenu=1
    nnoremap <leader>m :NERDTreeToggle<CR>

    " vim-lsp
    let g:asyncomplete_auto_popup = 1
    let g:lsp_diagnostics_enabled = 0 
    let g:lsp_document_highlight_enabled = 0
    let g:lsp_document_code_action_signs_enabled = 0

    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? "\<C-n>" . asyncomplete#close_popup() : "\<cr>"
    nnoremap <leader>r :LspDefinition<CR>
    nnoremap <Tab> :LspHover<CR>

    if executable('ruff')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ruff',
        \ 'cmd': {server_info->['ruff', 'server']},
        \ 'allowlist': ['python'],
        \ 'workspace_config': {},
        \ })
    endif

    " goyo
    map <leader>z :Goyo<cr>
    let g:goyo_width=90
    let g:goyo_height="95%"
    function! s:goyo_leave()
        set background=dark
    endfunction
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    " ale
    let g:ale_linters_explicit=1
    let g:ale_linters={'python': ['flake8','mypy']}
    let g:ale_set_highlights=0
    highlight clear ALEErrorSign
    highlight clear ALEWarningSign

    " javascript
    let g:javascript_plugin_jsdoc = 1

    " fzf
    nnoremap <silent><C-p> :Files<CR>
    nnoremap <leader>d :Buffers<CR>
    nnoremap <leader>f :Rg!<CR>

    " slime
    let g:slime_target = 'tmux'
    let g:slime_cell_delimiter = "# cell"
    let g:slime_python_ipython = 1
    nmap <C-r><C-r> <Plug>SlimeSendCell
