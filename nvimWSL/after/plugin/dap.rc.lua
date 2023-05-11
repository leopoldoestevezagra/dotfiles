local status, dap = pcall(require, "dap")
local status2, dapui = pcall(require, "dapui")
if (not status) then return end
if (not status2) then return end

dapui.setup({});

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" }
}

dap.configurations.typescript = { -- change to typescript if needed
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}
