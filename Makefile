docs:
	nvim --headless --clean -u ./scripts/minimal_init.lua -c "lua require('mini.doc').generate()" -c "qa!"

test:
	nvim --headless --clean -u ./scripts/minimal_init.lua -c "PlenaryBustedDirectory tests/"
