local M = {}

function M.executeLastCommand()
  if M.lastCommand then
    vim.cmd(M.lastCommand)
  end
end

-- function M.start()
--   vim.cmd('nnoremap <Down> lua require(\'vimspector\').executeLastCommand()')
--   vim.cmd('call vimspector#Launch()')
-- end

function M.stepInto()
  M.lastCommand = '<Plug>VimspectorStepInto'
  vim.cmd(M.lastCommand)
end

function M.stepOver()
  M.lastCommand = '<Plug>VimspectorStepOver'
  vim.cmd(M.lastCommand)
end

function M.stepOut()
  M.lastCommand = '<Plug>VimspectorStepOut'
  vim.cmd(M.lastCommand)
end

function M.runToCursor()
  M.lastCommand = '<Plug>VimspectorRunToCursor'
  vim.cmd(M.lastCommand)
end

function M.continue()
  M.lastCommand = 'call vimspector#Continue()'
  vim.cmd(M.lastCommand)
end

function M.reset()
  M.lastCommand = nil
  vim.cmd('VimspectorReset')
end

return M
