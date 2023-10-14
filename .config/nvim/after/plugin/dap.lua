local dap = require("dap")

dap.adapters['pwa-node'] = {
    type = 'server',
    host = '127.0.0.1',
    port = '${port}',
    executable = {
        -- Because of mason we can use this command
        command = 'js-debug-adapter',
        args = { '${port}' },
    }
}

dap.configurations.javascript = {
    {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
    },
    {
        type = 'pwa-node',
        request = 'launch',
        name = 'API',
        program = '${file}',
        cwd = '${workspaceFolder}',
        runtimeExecutable = "npm",
        runtimeArgs = "run serve"
    },
}
