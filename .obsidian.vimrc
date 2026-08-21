
set clipboard=unnamed

" CRITICAL: Unmap space so it stops behaving like a standard spacebar
unmap <Space>

" Space + o opens the File Switcher (Quick Open)
exmap quickOpen obcommand switcher:open
nmap <Space>o :quickOpen<CR>

" Space + f opens global search across the vault
exmap globalSearch obcommand global-search:open
nmap <Space>f :globalSearch<CR>

" Space + w saves/closes the active tab
exmap closeTab obcommand workspace:close
nmap <Space>w :closeTab<CR>
