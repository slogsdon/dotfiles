return {
  "olimorris/codecompanion.nvim",
  tag = "v12.13.0",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        codestral = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "codestral",
            schema = {
              model = {
                -- default = "qwen2.5-coder:14b-instruct-q4_K_M", -- works when prompted to use tools "qwen2.5:latest",
                default = "deepseek-r1:14b",
              },
              temperature = {
                default = 0.2,
              },
              num_ctx = {
                -- default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
        qwen25coder = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen25coder",
            schema = {
              model = {
                default = "qwen2.5:14b", -- fast "deepseek-coder-v2:16b", -- "qwen2.5-coder:14b",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "codestral",
        },
        inline = {
          adapter = "codestral",
        },
      },
      display = {
        chat = {
          window = { position = "right" },
        },
      },
    })

    vim.keymap.set(
      { "n", "v" },
      "<leader>cca",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "[c]ode [c]ompanion [a]ctions" }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>ccc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      { noremap = true, silent = true, desc = "[c]ode [c]ompanion [c]hat" }
    )
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
  init = function()
    require("plugins.code-assistant.fidget-spinner"):init()
  end,
}
