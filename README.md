
# :gear: Personal tweaks

:exclamation: Not opts but internal plugin tweaks not worthy of a fork. :exclamation:

### [Snacks](https://github.com/folke/snacks.nvim)

##### Files changed

`~/.local/share/nvim/lazy/snacks.nvim/lua/snacks/picker/format.lua`: alter diagnostics fields ordering (file first).

- Change order:

```lua
function M.diagnostic(item, picker)
  local ret = {} ---@type snacks.picker.Highlight[]
  local diag = item.item ---@type vim.Diagnostic
  if item.severity then
    vim.list_extend(ret, M.severity(item, picker))
  end

  ---- TO HERE! ----
  vim.list_extend(ret, M.filename(item, picker))


  ret[#ret + 1] = { diag.message }
  Snacks.picker.highlight.markdown(ret)
  ret[#ret + 1] = { " " }

  if diag.source then
    ret[#ret + 1] = { diag.source, "SnacksPickerDiagnosticSource" }
    ret[#ret + 1] = { " " }
  end

  if diag.code then
    ret[#ret + 1] = { ("(%s)"):format(diag.code), "SnacksPickerDiagnosticCode" }
    ret[#ret + 1] = { " " }
  end
  --^^^ Move this one up ^^^
  -- vim.list_extend(ret, M.filename(item, picker))
  return ret
end

```

