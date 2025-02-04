# Generate vim colorscheme
vim:
  node scripts/vim.js

# Install mini.test
deps:
  mkdir -p deps
  git clone https://github.com/echasnovski/mini.test.git deps/mini.test

# Run test
test:
  nvim -l tests/minitest.lua
