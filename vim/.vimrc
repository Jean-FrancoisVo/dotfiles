set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set smartindent
set autoindent
set showmode
set autowrite
syntax enable
set background=dark
colorscheme solarized

let mapleader = ","
map <C-t> :NERDTreeToggle<CR>
map <C-n> :cnext<CR>
map <C-b> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
inoremap " ""<left>
inoremap ' ''<left> 
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>O

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
