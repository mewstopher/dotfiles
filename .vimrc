execute pathogen#infect()
syntax on
filetype plugin indent on

syntax on

autocmd vimenter * NERDTree
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

