vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true


vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }



-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[
set mmp=50000
let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3' "python指定
let g:denops#deno = '/home/linuxbrew/.linuxbrew/bin/deno'

set termguicolors
set foldmethod=manual  "折りたたみ範囲の判断基準（デフォルト: manual）
set foldlevel=10
set foldcolumn=3       "左端に折りたたみ状態を表示する領域を追加する
function! s:is_view_available() abort " {{{
  if !&buflisted || &buftype !=# ''
    return 0
  elseif !filewritable(expand('%:p'))
    return 0
  endif
  return 1
endfunction " }}}
function! s:mkview() abort " {{{
  if s:is_view_available()
    silent! mkview
  endif
endfunction " }}}
function! s:loadview() abort " {{{
  if s:is_view_available()
    silent! loadview
  endif
endfunction " }}}
autocmd BufWritePost * call s:mkview()
autocmd BufRead * call s:loadview()
]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
