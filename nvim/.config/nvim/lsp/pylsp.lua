return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {
						"W391", -- blank line at end of file
						"E501", -- line too long
						"E302", -- two empty lines before function
						"E305", -- two empty lines after class
					},
				},
			},
		},
	},
}
