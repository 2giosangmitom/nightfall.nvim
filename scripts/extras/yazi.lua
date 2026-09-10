--- The yazi theme, a TOML file split into one table per part of the interface.
---
--- yazi rejects a table it does not know but silently ignores a key it does not
--- know, so a renamed key costs nothing at startup and simply stops being
--- painted. The tables and keys below track yazi 26.x: the hovered file moved
--- from `[mgr]` to `[indicator]`, the tab styles moved to `[tabs]`, `[confirm]`
--- renamed `content` to `body`, `[help]` renamed `on` and `run` to `chord` and
--- `action`, and a `[filetype]` rule matches a path under `url` rather than
--- `name`.

local toml = require("extras.toml")

--- The `[filetype]` table, whose one key is a list of rules. Each rule matches
--- on a path glob under `url` or a mime glob under `mime`, optionally narrowed
--- by `is`, and carries the style to paint a matching file with. The first rule
--- that matches wins, so the specific ones come before the fallbacks.
---
--- A mime glob is matched against the file's virtual path, which is why every
--- one of them starts with `**/`: a plain `image/*` would only match a file at
--- the root of a virtual filesystem, never one on disk.
---@param rules table[]
---@return string[]
---@private
local function filetype(rules)
  local lines = { "[filetype]", "rules = [" }

  for _, rule in ipairs(rules) do
    lines[#lines + 1] = "  " .. toml.render(rule) .. ","
  end

  lines[#lines + 1] = "]"
  lines[#lines + 1] = ""
  return lines
end

---@param ctx NightfallCtx
---@return string[]
return function(ctx)
  local c, accent = ctx.c, ctx.accent

  local lines = toml.sections({
    {
      "mgr",
      {
        { "cwd", { fg = c.cyan } },
        { "find_keyword", { fg = c.gold, bold = true } },
        { "find_position", { fg = c.magenta, bg = "reset", bold = true } },
        { "symlink_target", { fg = c.gray, italic = true } },
        { "marker_copied", { fg = c.green, bg = c.green } },
        { "marker_cut", { fg = c.red, bg = c.red } },
        { "marker_marked", { fg = c.teal, bg = c.teal } },
        { "marker_selected", { fg = c.gold, bg = c.gold } },
        { "count_copied", { fg = c.black, bg = c.green } },
        { "count_cut", { fg = c.black, bg = c.red } },
        { "count_selected", { fg = c.black, bg = c.gold } },
        { "border_symbol", "│" },
        { "border_style", { fg = c.border } },
      },
    },
    {
      "tabs",
      {
        { "active", { fg = c.black, bg = accent, bold = true } },
        { "inactive", { fg = c.fg, bg = c.overlay } },
      },
    },
    {
      "mode",
      {
        { "normal_main", { fg = c.black, bg = accent, bold = true } },
        { "normal_alt", { fg = accent, bg = c.overlay } },
        { "select_main", { fg = c.black, bg = c.green, bold = true } },
        { "select_alt", { fg = c.green, bg = c.overlay } },
        { "unset_main", { fg = c.black, bg = c.rose, bold = true } },
        { "unset_alt", { fg = c.rose, bg = c.overlay } },
      },
    },
    {
      -- The hovered file, in the parent, current and preview panes.
      "indicator",
      {
        { "parent", { fg = c.fg, bg = c.overlay } },
        { "current", { fg = c.fg, bg = c.overlay } },
        { "preview", { underline = true } },
      },
    },
    {
      "status",
      {
        { "overall", { fg = c.fg, bg = c.bg } },
        { "sep_left", { open = "", close = "" } },
        { "sep_right", { open = "", close = "" } },
        { "perm_sep", { fg = c.subtle } },
        { "perm_type", { fg = c.blue } },
        { "perm_read", { fg = c.gold } },
        { "perm_write", { fg = c.red } },
        { "perm_exec", { fg = c.green } },
        { "progress_label", { fg = c.white, bold = true } },
        { "progress_normal", { fg = accent, bg = c.overlay } },
        { "progress_error", { fg = c.red, bg = c.overlay } },
      },
    },
    {
      "which",
      {
        { "border", { fg = accent } },
        { "cols", 3 },
        { "mask", { bg = c.overlay } },
        { "cand", { fg = c.cyan } },
        { "rest", { fg = c.gray } },
        { "desc", { fg = c.magenta } },
        { "separator", "  " },
        { "separator_style", { fg = c.border } },
      },
    },
    {
      "confirm",
      {
        { "border", { fg = accent } },
        { "title", { fg = accent } },
        { "body", { fg = c.fg } },
        { "list", { fg = c.cyan } },
        { "btn_yes", { fg = c.black, bg = c.green } },
        { "btn_no", { fg = c.black, bg = c.red } },
        { "btn_labels", { "  Yes  ", "  (N)o  " } },
      },
    },
    {
      -- The spotter, which shows a file's metadata as a table.
      "spot",
      {
        { "border", { fg = accent } },
        { "title", { fg = accent } },
        { "tbl_col", { fg = c.cyan } },
        { "tbl_cell", { fg = c.black, bg = c.gold } },
      },
    },
    {
      "notify",
      {
        { "title_info", { fg = c.green } },
        { "title_warn", { fg = c.yellow } },
        { "title_error", { fg = c.red } },
      },
    },
    {
      "pick",
      {
        { "border", { fg = accent } },
        { "active", { fg = c.magenta, bold = true } },
        { "inactive", { fg = c.fg } },
      },
    },
    {
      "input",
      {
        { "border", { fg = accent } },
        { "title", { fg = c.fg } },
        { "value", { fg = c.fg } },
        { "selected", { bg = c.overlay } },
      },
    },
    {
      "cmp",
      {
        { "border", { fg = accent } },
        { "active", { fg = c.magenta, bold = true } },
        { "inactive", { fg = c.fg } },
      },
    },
    {
      "tasks",
      {
        { "border", { fg = accent } },
        { "title", { fg = c.fg } },
        { "hovered", { fg = c.magenta, underline = true } },
      },
    },
    {
      "help",
      {
        { "border", { fg = accent } },
        { "chord", { fg = c.cyan } },
        { "action", { fg = c.magenta } },
        { "hovered", { bg = c.overlay, bold = true } },
      },
    },
  })

  vim.list_extend(
    lines,
    filetype({
      -- Image.
      { mime = "**/image/*", fg = c.cyan },
      -- Media.
      { mime = "**/{audio,video}/*", fg = c.gold },
      -- Archive.
      { mime = "**/application/{,g}zip", fg = c.magenta },
      { mime = "**/application/{tar,bzip*,7z-compressed,xz,rar}", fg = c.magenta },
      -- Document.
      { mime = "**/application/{pdf,doc,rtf}", fg = c.green },
      -- A file on a virtual filesystem that is gone or out of date.
      { mime = "vfs/{absent,stale}", fg = c.gray },
      -- A symlink with nothing behind it, and a file yazi could not stat.
      { url = "*", is = "orphan", bg = c.red },
      { url = "*", is = "dummy", bg = c.red },
      { url = "*/", is = "dummy", bg = c.red },
      -- Anything executable, then any directory the rules above missed.
      { url = "*", is = "exec", fg = c.green },
      { url = "*/", fg = accent },
    })
  )

  return lines
end
