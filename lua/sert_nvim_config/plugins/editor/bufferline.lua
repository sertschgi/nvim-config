return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },
  init = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr


    ---Translates color from HTML to RGB.
    ---@param color string hex color code
    ---@return table
    local function hexToRgb(color)
      local hex = "[abcdef0-9][abcdef0-9]"
      local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
      color = string.lower(color)

      assert(
        string.find(color, pat) ~= nil,
        "hex_to_rgb: invalid hex_str: " .. tostring(color)
      )

      local r, g, b = string.match(color, pat)
      return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
    end

    ---Util for blending colors. Alpha coefficeint should be between [0-1]
    ---where 0=b and 1=a.
    ---@param a string foreground color in hex
    ---@param b string background color in hex
    ---@param coeff number blend coefficient
    ---@return string
    function blend(a, coeff, b)
      local A = hexToRgb(a)
      local B = hexToRgb(b)
      local alpha = math.abs(coeff)

      local blendChannel = function(i)
        local ret = ((1 - alpha) * B[i] + alpha * A[i])
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
      end

      return string.format(
        "#%02X%02X%02X",
        blendChannel(1),
        blendChannel(2),
        blendChannel(3)
      )
    end

    function get_focus(buffer)
      if buffer.is_focused
      then
        return blend(buffer.devicon.color, 0.30, "#000000")
      else
        return blend(get_hex('Comment', 'fg'), 0.4, "#000000")
      end
    end

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and get_hex('Normal', 'fg')
              or blend(get_hex('Normal', 'fg'), 0.7, "#000000")
        end,
        bg = get_focus,
      },

      components = {
        {
          text = function(buffer) return buffer.is_first and '' or '◥' end,
          fg = get_focus,
          bg = "#222324"
        },
        {
          text =
          ' '
        },
        {
          text = function(buffer) return buffer.devicon.icon end,
          fg = function(buffer)
            return buffer.is_focused and buffer.devicon.color or
                blend(get_hex('Normal', 'fg'), 0.7, "#000000")
          end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true,
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          bold = function(buffer) return buffer.is_focused end,
          italic = function(buffer) return not buffer.is_focused end,
        },
        {
          text = '◣',
          fg = get_focus,
          bg = "#222324"
        },
      },

      buffers = {
        filter_valid = function(buffer) return buffer.filtype == '' end,
        new_buffers_position = 'directory',
      },
    })
  end,
}
