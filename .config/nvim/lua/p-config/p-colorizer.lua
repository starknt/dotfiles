require("colorizer").setup {
  filetypes = {
    "css",
    "javascript",
    'typescript',
    'javascriptreact',
    'typescriptreact',
    html = {
      mode = 'foreground'
    },
  },
  user_default_options = {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue or blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    AARRGGBB = true, -- 0xAARRGGBB hex codes
    rgb_fn = false, -- CSS rgb() and rgba() functions
    hsl_fn = false, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = "background", -- Set the display mode.
    tailwind = true, -- Enable tailwind colors
    virtualtext = "■",
  },
  buftypes = {},
}
