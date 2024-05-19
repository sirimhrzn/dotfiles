return {
  {
    "APZelos/blamer.nvim",
  },
  {
    "simrat39/rust-tools.nvim",
  },
  {
    "folke/zen-mode.nvim",
  },
  {'nvim-telescope/telescope.nvim',
  	tag = '0.1.5',
      	dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { "folke/neodev.nvim", opts = {} },

{"preservim/nerdtree"},
	{
  "karb94/neoscroll.nvim",
  config = function ()
    require('neoscroll').setup {}
  end
}, 
	{ "Aszarsha/elysian.vim" },
	{ "navarasu/onedark.nvim" },
	{ "rebelot/kanagawa.nvim"},
	{ "Shatur/neovim-ayu"},
	{
    "folke/trouble.nvim",
  },
  {'simrat39/inlay-hints.nvim'},
{"sindrets/diffview.nvim",
config = function()
	require("diffview").setup({})
end
},
-- {"nyoom-engineering/nyoom.nvim"},
{"folke/tokyonight.nvim"},
{"savq/melange-nvim"},
-- {"nyoom-engineering/oxocarbon.nvim"},
{"AlexvZyl/nordic.nvim"},
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{
	"foxoman/vim-helix"
},
{
	"santos-gabriel-dario/darcula-solid.nvim"
},
{
	"rktjmp/lush.nvim"
},
{
	"doums/darcula"
},
{
  "rockyzhang24/arctic.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  name = "arctic",
  branch = "main",
  priority = 1000,
},
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
{ 
  "nyoom-engineering/oxocarbon.nvim"
}, 
  {
    'gsuuon/note.nvim',
    opts = {
      -- Spaces are note roots. These directories should contain a `./notes` directory (will be made if not).
      -- Defaults to { '~' }.
      spaces = {
        '~',
        -- '~/projects/foo'
      },

      -- Set keymap = false to disable keymapping
      -- keymap = { 
      --   prefix = '<leader>n'
      -- }
    },
    cmd = 'Note',
    ft = 'note'
  }


}
