return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = {
	    implementation = "prefer_rust_with_warning",
	    prebuilt_binaries = {
		    -- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`,
		    -- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
		    -- Disabled by default when `fuzzy.implementation = 'lua'`
		    download = true,

		    -- Ignores mismatched version between the built binary and the current git sha, when building locally
		    ignore_version_mismatch = false,

		    -- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
		    -- then the downloader will attempt to infer the version from the checked out git tag (if any).
		    --
		    -- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
		    force_version = nil,

		    -- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
		    -- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
		    -- Check the latest release for all available system triples
		    --
		    -- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
		    force_system_triple = nil,

		    -- Extra arguments that will be passed to curl like { 'curl', ..extra_curl_args, ..built_in_args }
		    extra_curl_args = {},

		    proxy = {
			    -- When downloading a prebuilt binary, use the HTTPS_PROXY environment variable
			    from_env = true,

			    -- When downloading a prebuilt binary, use this proxy URL. This will ignore the HTTPS_PROXY environment variable
			    url = nil,
		    },
	    },
    },


    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    -- keymap = { preset = 'default' },
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
