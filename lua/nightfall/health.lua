local M = {}

local health = vim.health

-- Function to get the latest Nightfall.nvim version and Neovim version
local function get_version()
  local nightfall_version = vim.fn.system({ "git", "describe", "--tags", "--abbrev=0" }):gsub("%s+", "")
  local ver = vim.version()
  local neovim_version = string.format("v%s.%s.%s", ver.major, ver.minor, ver.patch)

  return { nightfall = nightfall_version, neovim = neovim_version }
end

-- Function to perform health check for Nightfall.nvim
function M.check()
  local version = get_version()
  health.start("Nightfall.nvim")

  health.info("Nightfall.nvim version: " .. version.nightfall)
  health.info("Neovim version: " .. version.neovim)

  if vim.fn.has("nvim-0.11") == 1 then
    health.warn("Neovim nightly is not officially supported and may have breaking changes.")
  elseif vim.fn.has("nvim-0.9.5") == 1 then
    health.ok("Using stable Neovim >= 0.9.5.")
  else
    health.error("Neovim >= 0.9.5 is required.")
  end
end

return M
