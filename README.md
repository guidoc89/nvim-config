
# :gear: Personal tweaks

:exclamation: Not opts but internal plugin tweaks, should probably fork Sakura, will locally override for now. :exclamation:

## [Sakura](https://github.com/anAcc22/sakura.nvim)

##### Files changed
`~/.local/share/nvim/lazy/sakura.nvim/lua/lush_theme/sakura.lua`: add and tweak some highlights groups, SPECIALLY strings as green!!!!!!!!!


- Add:
```lua
    local dark  = {
        -- ...
        bg9 = hsluv(300, 0, 50),
        -- ...
    }

```

- Tweak:

```lua
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- ...

    ---- Old
    -- Normal         { bg = palette.bg0, fg = palette.fg0 },
    ---- New
    Normal         { bg = "#1e2030", fg = palette.fg0 },

    ------------- BEST ONE!!!
    ---- Old
    String         { fg = palette.gb0, italic= true },
    ---- New (green strings!)
    String         { fg = palette.gr0, italic= true },

    ---- Old
    -- Comment        { fg = palette.bg3, italic = true }, -- Any comment
    ---- New
    Comment        { fg = palette.bg9, italic = true }, -- Any comment


    ---- Add
    VariableMember { fg = palette.gb0 }, --  The lhs in "value = models.CharField()". Show it different than functions parameters

    ---- Old
    -- Type           { fg = palette.sa0, italic= true, bold = true }, -- (*) int, long, char, etc.
    ---- New
    Type           { fg = palette.sa0, italic= false, bold = true }, -- (*) int, long, char, etc.

    ---- Old
    -- SpellBad       { sp = palette.er0, undercurl = true }, 
    ---- New
    SpellBad       { sp = palette.er0, undercurl = true, fg = palette.yl9, bg = palette.sr0 }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- ...

    ---- Old
    -- sym"@parameter"         { fg = palette.fg1 }, -- Identifier
    ---- New
    sym"@parameter"         { Function }, -- Identifier

    ---- Add
    sym"@variable.parameter"{ Keyword }, -- parameters inside a function call (parentheses)
    sym"@variable.member"   { VariableMember }, --  the lhs in "value = models.CharField()" Character

    ---- Add
    sym"@tag.attribute.javascript"       {Identifier }, -- NOTE: this works (does links)!
    sym"@lsp.typemod.variable.defaultLibrary.javascriptreact" { Type }, -- TODO: this could be improved with a new color maybe? a little bit darker

    }
end

```

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

