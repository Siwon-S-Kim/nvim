return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    -- Tell the plugin to use our secure Docker wrapper instead of the standard CLI
    terminal_cmd = 'claude-docker',
    terminal = {
      provider = 'external',
      provider_opts = {
        external_terminal_cmd = 'alacritty -e %s', -- %s is replaced with claude command
        -- Or with working directory: "alacritty --working-directory %s -e %s" (first %s = cwd, second %s = command)
      },
    },
    -- terminal = {
    --   ---@module "snacks"
    --   ---@type snacks.win.Config|{}
    --   snacks_win_opts = {
    --     position = 'float',
    --     width = 0.9,
    --     height = 0.9,
    --     keys = {
    --       claude_hide = {
    --         '<M-,>',
    --         function(self)
    --           self:hide()
    --         end,
    --         mode = 't',
    --         desc = 'Hide',
    --       },
    --     },
    --   },
    -- },
  },
  config = true,
  cmd = {
    'ClaudeCode',
    'ClaudeCodeFocus',
    'ClaudeCodeSelectModel',
    'ClaudeCodeAdd',
    'ClaudeCodeSend',
    'ClaudeCodeTreeAdd',
    'ClaudeCodeStatus',
    'ClaudeCodeStart',
    'ClaudeCodeStop',
    'ClaudeCodeOpen',
    'ClaudeCodeClose',
    'ClaudeCodeDiffAccept',
    'ClaudeCodeDiffDeny',
    'ClaudeCodeCloseAllDiffs',
  },
  keys = {
    { '<leader>cc', nil, desc = 'AI/Claude Code' },
    { '<leader>ccc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>ccf', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>ccr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>ccC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>ccm', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>ccb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>ccs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>ccs',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw', 'snacks_picker_list' },
    },
    -- Diff management
    { '<leader>ccy', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>ccn', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
