local mason_registry = require('mason-registry')
local dap = require('dap')
local dapui = require("dapui")

function StartServer()
  vim.cmd('FloatermNew! --silent --autoclose=1 ~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb --port 13000')
  CompileDebugCProject()
end

dap.adapters.python = {
  type = 'executable';
  command = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python";
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000
}

dap.configurations.c = {
  {
        type = 'codelldb';
        request = 'launch';
        program = function()
            StartServer()
            return vim.fn.getcwd() .. '/${fileBasenameNoExtension}'
        end;
        --program = '${fileDirname}/${fileBasenameNoExtension}',
        cwd = '${workspaceFolder}';
        terminal = 'integrated';
  }
}

dap.configurations.cpp = dap.configurations.c

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()

