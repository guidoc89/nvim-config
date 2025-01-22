---@class Utils
---@field root_patterns string[]
---@field on_attach fun(on_attach: fun(client: any, buffer: number)): nil
---@field get_root fun(): string
---@field telescope fun(builtin: string, opts: table<string, any>): fun()
---@field snacks_telescope_opts table<string, any>
---@field snacks_ivy_opts table<string, any>
---@field add_opts_to_base fun(base_opts: table<string, any>, extra_opts: table<string, any>): table<string, any>
---@field icons table<string, any>
local M = {}

M.root_patterns = { ".git", "lua" }

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

---@return string
function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace and vim.tbl_map(function(ws)
        return vim.uri_to_fname(ws.uri)
      end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end


-- this will return a function that calls telescope.
-- cwd will default to lazyvim.util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
function M.telescope(builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    if opts.cwd and opts.cwd ~= vim.loop.cwd() then
      opts.attach_mappings = function(_, map)
        map("i", "<a-c>", function()
          local action_state = require("telescope.actions.state")
          local line = action_state.get_current_line()
          M.telescope(
            params.builtin,
            vim.tbl_deep_extend("force", {}, params.opts or {}, { cwd = false, default_text = line })
          )()
        end)
        return true
      end
    end

    require("telescope.builtin")[builtin](opts)
  end
end

M.snacks_telescope_opts = {
	exclude = { "venv", ".git", },
	layout = {
		reverse = true,
		layout = {
			box = "horizontal",
			backdrop = false,
			width = 0.95,
			height = 0.9,
			border = "none",
			{
				box = "vertical",
				{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
				{ win = "input", height = 1, border = "rounded", title = "{source} {live}", title_pos = "center" },
			},
			{
				win = "preview",
				width = 0.55,
				border = "rounded",
				title = " Preview ",
				title_pos = "center",
			},
		},
	},
}

M.snacks_ivy_opts = {
	exclude = { "venv", ".git", },
	layout = {
		layout = {
			box = "vertical",
			backdrop = false,
			row = -1,
			width = 0,
			height = 0.6,
			border = "top",
			title = " {source} {live}",
			title_pos = "left",
			{ win = "input", height = 1, border = "bottom" },
			{
				box = "horizontal",
				{ win = "list", border = "none" },
				{ win = "preview", width = 0.6, border = "left" },
			},
		},
	},
}

---@param base_opts table<string, any>
---@param extra_opts table<string, any>
---@return table<string, any>
function M.add_opts_to_base(base_opts, extra_opts)
    local final_opts = {}
    for k,v in pairs(base_opts) do
        final_opts[k] = v
    end

    for k,v in pairs(extra_opts) do
        final_opts[k] = v
    end
    return final_opts
end

M.icons = {
    dap = {
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    },
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    kinds = {
      Array = " ",
      Boolean = " ",
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = " ",
      Null = " ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
  }

return M
