-- initi lua place ~ XDG_CONFIG_HOME/nvim/init.lua
print('1test some mapfunction in lua hello from ~/.config/nvim/lua/basic.lua')


local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)

  -- if n_lines == 1 then
  --   lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  -- else
  --   lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  -- end
  print(lines[n_lines])
  print(s_start[3])
  print(s_end[3])
    -- print(s_start, s_end, n_lines, lines)
  vim.fn.setreg('/', table.concat(lines, '\n'))
  -- return table.concat(lines, '\n')
end


local function capture_messages()
    local messages_output = vim.fn.execute('messages')
    local messages_lines = vim.split(messages_output, '\n')

    local nLines = 10
    local last_n_lines = {}
    -- reverse the order of the lines

    table.insert(last_n_lines, "## Log order is from newest to oldest ##")
    for i = #messages_lines, #messages_lines - nLines, -1 do
    -- for i = #messages_lines - nLines, #messages_lines do
        table.insert(last_n_lines, messages_lines[i])
    end

    vim.api.nvim_put(last_n_lines, 'l', true, true)
end

-- MAPPING SECTION

-- set the wrong text
vim.keymap.set('v', '<C-f>', function() 
    return get_visual_selection()
end, { noremap = true, silent = true, desc = 'in basic.lua save visual selection to register /' })
vim.keymap.set('n', '<C-M-o>', function()
    return capture_messages()
end, { desc = 'output vim log messages' })

