local dap = require("dap")

require("dap-vscode-js").setup({
  -- node_path = os.getenv('HOME') .. '/.nvm/versions/node/v18.2.0/bin/node',
  debugger_path = '~/Dev/vscode-js-debug',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
   {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    sourceMaps = true,
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  }}
end
