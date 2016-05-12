"===== Basic configuration ====="
set nocompatible
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set number
set list
set laststatus=2
set cursorcolumn
set cursorline
set nowrap
set noswapfile

"===== Colors and theme ====="
set t_Co=256
let g:molokai_original = 1
colorscheme molokai

"===== Plugins ====="
" Filetype off is required by vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Vundle plugins
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Shutnik/jshint2.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()
filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"===== Lightline status bar configuration ====="
let g:lightline = {
    \ "component": {
        \ "readonly": '%{&readonly?"⭤":""}',
    \ },
    \ "active": {
    \   "left": [ [ "mode", "paste" ], [ "fugitive", "filename" ] ]
    \ },
    \"component_function": {
    \    "fugitive": "MyFugitive",
    \ },
    \ "separator": { "left": "\ue0b0", "right": "\ue0b2" },
    \ "subseparator": { "left": "\ue0b1", "right": "\ue0b3" }
\ }

function! MyFugitive()
    try
        if expand("%:t") !~? "Tagbar\|Gundo\|NERD" && &ft !~? "vimfiler" && exists("*fugitive#head")
            let mark = ""  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? "\ue0a0 " . _ : "\ue0a0 no-branch"
        endif
    catch
    endtry
    return ""
endfunction

"===== Syntax ====="
syntax on
au BufNewFile,BufRead *.scss,*.sass set syntax=css
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.v

