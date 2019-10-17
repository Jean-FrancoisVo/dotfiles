set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set noerrorbells
set ruler
set showcmd
set number
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set smartindent
set autoindent
set showmode
set autowrite
set updatetime=100
syntax enable
set background=dark
colorscheme solarized
set omnifunc=syntaxcomplete#Complete

let mapleader = ","
map <F6> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-b> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
inoremap " ""<left>
inoremap ' ''<left> 
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>O

" GO CONFIGURATION

" Go shortcuts
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

" Run :GoBuild or :GoTestCompile based on the go file 
function! s:build_go_files() 
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_test_show_name = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let $GOPATH = "/home/hieu/workspace/go"
