docs:
	nvim --headless -u ./scripts/minimal_init.lua -c "lua require('mini.doc').generate()" -c "qa!"
