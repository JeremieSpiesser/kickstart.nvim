local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

local vault_location = os.getenv 'DENDRON_VAULT'

local M = {}

function M.childrens_files()
  local name = vim.fn.expand '%:r'
  local list = vim.fn.glob(vault_location .. string.format('/%s.*.md', name))
  return vim.split(list, '\n', { trimempty = true })
end

function M.telescope_childrens()
  local opts = {}
  pickers
    .new(opts, {
      prompt_title = 'Dendron childrens',
      finder = finders.new_table {
        results = M.childrens_files(),
      },
      previewer = require('telescope.previewers').vim_buffer_cat.new {},
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

function M.mediainfo_popup()
  local api = vim.api
  local Job = require('plenary.job')
    local bufnr = api.nvim_get_current_buf()
    local filepath = api.nvim_buf_get_name(bufnr)
    if not filepath or #filepath == 0 then
        vim.notify("No file is currently being edited", vim.log.levels.ERROR)
        return
    end
    local win_opts = {
        relative = 'editor',
        width = math.floor(api.nvim_win_get_width(0) * 0.8),
        height = math.floor(api.nvim_win_get_height(0) * 0.6),
        col = math.floor((api.nvim_win_get_width(0) - math.floor(api.nvim_win_get_width(0) * 0.8)) / 2),
        row = math.floor((api.nvim_win_get_height(0) - math.floor(api.nvim_win_get_height(0) * 0.6)) / 2),
        border = 'rounded',
        style = 'minimal',
        focusable = true,
    }
    -- Create buffer and window
    local bufnr = api.nvim_create_buf(false, true)
    local winnr = api.nvim_open_win(bufnr, true, win_opts)
    -- Set buffer options
    api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
    api.nvim_win_set_option(winnr, 'winhl', 'Normal:NormalFloat')
    -- Run mediainfo command


      Job:new({
        command = 'mediainfo',
        args = { filepath },
        on_stdout = function(_, line)
            vim.schedule(function()
                api.nvim_buf_set_lines(bufnr, -1, -1, false, {line})
            end)
        end,
        on_stderr = function(_, err)
            vim.notify("Error running mediainfo: " .. err, vim.log.levels.ERROR)
        end,
        on_exit = function(j, return_val)
            if return_val ~= 0 then
                vim.notify("Failed to get media information", vim.log.levels.ERROR)
            end
        end,
    }):start()

  api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<Cmd>close<CR>', 
        { noremap = true, silent = true, desc = 'Close media info popup' })

end


function M.show_file_browser()
  local api = vim.api
  local scandir = require('plenary.scandir')
    -- Get current directory
    local cwd = vim.fn.getcwd()
    -- Create main window for file list
    local ui = vim.api.nvim_list_uis()[1]
    local width = math.floor(ui.width * 0.45)  -- Make each window ~45% of screen width
    local height = math.floor(ui.height * 0.8)
    local main_win_opts = {
        relative = 'editor',
        width = width,
        height = height,
        col = 0,           -- Leftmost position
        row = (ui.height - height) / 2,  -- Center vertically
        border = 'rounded',
        style = 'minimal',
        focusable = true,
    }
    -- Create buffer and window for file list
    local main_bufnr = api.nvim_create_buf(false, true)
    local main_winnr = api.nvim_open_win(main_bufnr, true, main_win_opts)
    -- Set buffer options
    api.nvim_buf_set_option(main_bufnr, 'bufhidden', 'wipe')
    api.nvim_win_set_option(main_winnr, 'winhl', 'Normal:NormalFloat')
    -- Create preview window
    local preview_win_opts = {
        --relative = 'win',
        relative = 'editor',
        -- win = main_winnr,
        width = width,
        height = height,
        col = ui.width - width,  -- Rightmost position
        row = (ui.height - height) / 2,  -- Center vertically
        border = 'rounded',
        style = 'minimal',
        focusable = true,
    }
    -- Create buffer and window for preview
    local preview_bufnr = api.nvim_create_buf(false, true)
    local preview_winnr = api.nvim_open_win(preview_bufnr, true, preview_win_opts)
    -- Set buffer options
    api.nvim_buf_set_option(preview_bufnr, 'bufhidden', 'wipe')
    api.nvim_win_set_option(preview_winnr, 'winhl', 'Normal:NormalFloat')
    -- Get files in current directory
    local files = {}
    local err
    files, err = scandir.scan_dir(cwd, {
        depth = 1,
        add_dirs = true,
        on_insert = function(entry, _)
            table.insert(files, entry.path)
        end,
    })
    if err then
        api.nvim_buf_set_lines(main_bufnr, 0, -1, false, { "Error: " .. err })
        return
    end
    -- Sort files
    table.sort(files)
    -- Set up file list
    api.nvim_buf_set_lines(main_bufnr, 0, -1, false, files)
    -- Add keymaps
    api.nvim_buf_set_keymap(main_bufnr, 'n', 'q', '<Cmd>close<CR>',
        { noremap = true, silent = true, desc = 'Close file browser' })
    api.nvim_buf_set_keymap(preview_bufnr, 'n', 'q', '<Cmd>close<CR>',
        { noremap = true, silent = true, desc = 'Close file browser' })
    -- Set up cursor movement handler
    api.nvim_create_autocmd('CursorMoved', {
        --pattern = { main_bufnr },
        pattern = { '*' },
        callback = function()
            local line = api.nvim_win_get_cursor(main_winnr)[1]
            local filepath = api.nvim_buf_get_lines(main_bufnr, line-1, line, true)[1]
            -- Clear preview buffer
            api.nvim_buf_set_lines(preview_bufnr, 0, -1, false, {})
            -- Preview file content
            if filepath then
                local content = {}
                local file = io.open(filepath, 'r')
                if file then
                    for line in file:lines() do
                        table.insert(content, line)
                    end
                    file:close()
                    -- Add preview header
                    table.insert(content, 1, "Preview of: " .. filepath)
                    table.insert(content, 2, string.rep('-', 50))
                    -- Set preview content
                    api.nvim_buf_set_lines(preview_bufnr, 0, -1, false, content)
                end
            end
        end,
    })
end

vim.keymap.set('n', '<leader>du', function()
  M.telescope_childrens()
end)

vim.keymap.set('n', '<leader>da', function()
  M.mediainfo_popup()
end)

vim.keymap.set('n', '<leader>dz', function()
  M.show_file_browser()
end)

return {
  -- {
  --   'axkirillov/easypick.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  --   config = function()
  --     local easypick = require 'easypick'
  --
  --     easypick.setup {
  --       pickers = {
  --         {
  --           name = 'Dendron childrens',
  --           command = 'dendron-list-childrens ' .. vim.fn.expand '%:r',
  --           previewer = easypick.previewers.default(),
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'Kicamon/markdown-table-mode.nvim',
    config = function()
      require('markdown-table-mode').setup()
    end,
  },
  --{ dir = '~/coding/jte.nvim/', config = true },
}
