return {
  'saghen/blink.cmp',
  dependencies = {
      'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', },
    },
    fuzzy = {
	    implementation = "prefer_rust_with_warning",
	    prebuilt_binaries = {
		    download = true,
		    ignore_version_mismatch = false,
		    force_version = nil,
		    force_system_triple = nil,
		    extra_curl_args = {},

		    proxy = {
			    from_env = true,
			    url = nil,
		    },
	    },
    },
    keymap = {
	    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
	    ["<CR>"] = { "accept", "fallback" },

	    ["<Tab>"] = {
		    function(cmp)
			    return cmp.select_next()
		    end,
		    "snippet_forward",
		    "fallback",
	    },
	    ["<S-Tab>"] = {
		    function(cmp)
			    return cmp.select_prev()
		    end,
		    "snippet_backward",
		    "fallback",
	    },
    },

  },
  opts_extend = { "sources.default" }
}
