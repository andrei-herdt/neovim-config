return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
{
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  enabled = false,
  cmd = "CopilotChat",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      context = "buffer:listed",
    }
  end,
  keys = {
    { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    { "<C-k>",
        function()
          return require("CopilotChat").reset()
        end,
        ft = "copilot-chat",
        desc = "Clear buffer"
    },
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    { "<leader>aa",
      function()
        return require("CopilotChat").toggle({
          model = "gpt-5",
          sticky = {"#buffer:listed"},
          })
      end,
      desc = "Toggle (CopilotChat, buffer context)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({
          prompt = "Quick Chat: ",
        }, function(input)
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end)
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        require("CopilotChat").select_prompt()
      end,
      desc = "Prompt Actions (CopilotChat)",
      mode = { "n", "v" },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })

    -- Force-remove CopilotChat's <C-l> mappings (normal/insert/visual)
    local function remove_ctrl_l(ev)
      for _, m in ipairs({ "n", "i", "v" }) do
        pcall(vim.keymap.del, m, "<C-l>", { buffer = ev.buf })
      end
    end

    for _, event in ipairs({ "FileType", "BufWinEnter", "BufReadPost" }) do
      vim.api.nvim_create_autocmd(event, {
        pattern = "copilot-chat",
        callback = remove_ctrl_l,
      })
    end


    chat.setup(opts)
  end,
}
}
