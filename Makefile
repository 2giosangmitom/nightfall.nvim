docs: deps/mini.nvim
	nvim --headless --clean -u ./scripts/minimal_init.lua -c "lua require('mini.doc').generate()" -c "qa!"

test: deps/mini.nvim
	nvim --headless --clean -u ./scripts/minimal_init.lua -c "lua require('mini.test').run()" -c "qa!"

deps/mini.nvim:
	@mkdir -p deps
	git clone --filter=blob:none https://github.com/echasnovski/mini.nvim deps/mini.nvim
