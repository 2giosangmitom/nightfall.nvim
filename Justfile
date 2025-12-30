# Generate vim colorscheme
vim:
  node scripts/vim.js

# Install mini.test
deps:
  mkdir -p deps
  git clone https://github.com/echasnovski/mini.test.git deps/mini.test
  git clone https://github.com/echasnovski/mini.doc.git deps/mini.doc

# Run tests using mini.test
test:
  nvim --headless -u scripts/minit.lua -c "lua require('mini.test').run()" -c "qa!"
