# Show the available recipes.
default:
    @just --list

# Clone the development dependencies into `deps/`.
deps:
    mkdir -p deps
    test -d deps/mini.test || git clone --depth 1 https://github.com/nvim-mini/mini.test deps/mini.test
    test -d deps/mini.doc || git clone --depth 1 https://github.com/nvim-mini/mini.doc deps/mini.doc

# Run the test suite with mini.test.
test:
    nvim --headless -u scripts/minit.lua -c "lua MiniTest.run()" -c "qa!"

# Run a single test file, for example `just test-file tests/test_theme.lua`.
test-file file:
    nvim --headless -u scripts/minit.lua -c "lua MiniTest.run_file('{{ file }}')" -c "qa!"

# Regenerate `doc/nightfall.txt` from the source annotations with mini.doc.
docs:
    nvim --headless -u scripts/minit.lua -c "luafile scripts/minidoc.lua" -c "qa!"

# Regenerate the terminal and tool themes under `extras/`.
extras:
    nvim --headless -u scripts/minit.lua -c "luafile scripts/extras.lua" -c "qa!"

# Format the Lua sources with stylua.
fmt:
    stylua .

# Check that the Lua sources are formatted.
fmt-check:
    stylua --check .

# Regenerate everything that is committed but generated.
generate: docs extras

# Run everything the CI runs.
ci: fmt-check test generate
