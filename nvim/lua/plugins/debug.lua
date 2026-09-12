return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- definition
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "::1",
			port = "${port}",
			executable = {
				command = "node",
				args = { "/home/uriel/Documents/Apps/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}

		-- configs
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node",
				address = "127.0.0.1",
				port = 9229,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
		}

		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node",
				address = "127.0.0.1",
				port = 9229,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			},
		}
	end,
}
