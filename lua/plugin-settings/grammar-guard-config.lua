require("grammar-guard").init()
-- setup LSP config
require("lspconfig").grammar_guard.setup({
settings = {
	ltex = {
		enabled = { "latex", "tex", "bib", "markdown" },
		language = "en",
		diagnosticSeverity = "information",
		setenceCacheSize = 2000,
		additionalRules = {
			enablePickyRules = true,
			motherTongue = "en",
		},
		trace = { server = "verbose" },
		dictionary = {},
		disabledRules = {},
		hiddenFalsePositives = {},
	},
},
})
