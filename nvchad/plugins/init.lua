return {
  ["akinsho/flutter-tools.nvim"] = {
    config = [[require("custom.configs.flutter-tools")]]
  },
  ["andweeb/presence.nvim"] = {
    config = [[require("custom.configs.presence")]]
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["stevearc/dressing.nvim"] = {
  },
  ["rcarriga/nvim-notify"] = {
  },
  ["wakatime/vim-wakatime"] = {
  },
  ["Pocco81/AutoSave.nvim"] = {
    config = [[require("custom.configs.autosave")]]
  },
  ["folke/twilight.nvim"] = {
    config = [[require("custom.configs.twilight")]]
  },
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = [[require("custom.configs.zen-mode")]]
  }
}

