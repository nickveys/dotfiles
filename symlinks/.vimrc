set nocompatible
filetype on
filetype indent on
filetype plugin on
set laststatus=2

" spaces for tabs
set expandtab
" 4 spaces for a tab
set tabstop=4
" 4 spaces for indentation
set shiftwidth=4

syntax on
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
