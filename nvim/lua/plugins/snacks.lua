return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    terminal = {},
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    vim.keymap.set({ "n", "i" }, "<leader>r", function()
      -- 1. Save current buffer automatically
      vim.cmd("silent! write")

      if vim.bo.filetype ~= "cpp" then
        vim.notify("Not a C++ file!", vim.log.levels.WARN)
        return
      end

      -- 2. Extract paths
      local filepath = vim.fn.expand("%:p")
      local filedir  = vim.fn.expand("%:p:h")
      local filename = vim.fn.expand("%:t:r")
      local binpath  = filedir .. "/" .. filename
      local input_file = filedir .. "/in.txt"

      -- 3. If in.txt exists alongside your cpp file, pipe it automatically for batch execution
      local run_cmd = binpath
      if vim.fn.filereadable(input_file) == 1 then
        run_cmd = string.format("%s < %s", binpath, vim.fn.shellescape(input_file))
      end

      -- 4. Build execution string
      local cmd = string.format(
        "cd %s && (g++ -O2 -std=c++17 -w %s -o %s && %s); echo ''; printf 'Press enter to close...'; read -r",
        vim.fn.shellescape(filedir),
        vim.fn.shellescape(filepath),
        vim.fn.shellescape(binpath),
        run_cmd
      )

      -- 5. Open via Snacks Terminal
      Snacks.terminal.open(cmd, {
        cwd = filedir,
        auto_close = false,
        auto_insert = true,
        start_insert = true,
        win = {
          style = "terminal",
          position = "float",
          backdrop = 60,
          width = 0.8,
          height = 0.8,
          border = "rounded",
          title = " C++ Competitive Programming ",
          title_pos = "center",
        },
      })
    end, { desc = "CP: Compile & Run with Snacks Terminal" })
  end,
}
