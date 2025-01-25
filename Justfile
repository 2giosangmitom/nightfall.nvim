# Run test with mini.test
test:
  nvim -l tests/busted.lua --minitest

# Generate vim colorscheme
vim:
  node scripts/vim.js
