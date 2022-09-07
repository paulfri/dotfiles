require("setup")
require("plugins")
require("options")
require("bindings")
require("autocmd")

require("theme")

require("dap-python").setup("~/.pyenv/versions/debugpy/bin/python")
require("dap-python").test_runner = "pytest"

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "Django",
	program = vim.fn.getcwd() .. "/manage.py",
	args = { "runserver", "--noreload", "0.0.0.0:9000" },
	integratedTerminal = true,
})
