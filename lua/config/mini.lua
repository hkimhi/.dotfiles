-- original config copied from: https://old.reddit.com/r/neovim/comments/ug2v0n/finally_found_a_good_replacement_for_startify/

local header_art = 
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

-- setup mini.sessions
require('mini.sessions').setup({
  -- Whether to read latest session if Neovim opened without file arguments
  autoread = false,
  -- Whether to write current session before quitting Neovim
  autowrite = false,
  -- Directory where global sessions are stored (use `''` to disable)
  directory =  '', 
  -- File for local session (use `''` to disable)
  file = 'session.vim' 
})

-- setup mini.starter
local starter = require("mini.starter")
starter.setup({
  -- evaluate_single = true,
  items = {
    starter.sections.sessions(77, true),
    starter.sections.builtin_actions(),
  },
  content_hooks = {
    function(content)
      local blank_content_line = { { type = 'empty', string = '' } }
      local section_coords = starter.content_coords(content, 'section')
      -- Insert backwards to not affect coordinates
      for i = #section_coords, 1, -1 do
        table.insert(content, section_coords[i].line + 1, blank_content_line)
      end
      return content
    end,
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.aligning('center', 'center'),
  },
  header = header_art,
  footer = '',
})
