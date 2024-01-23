local ensure_packer = function()
	local rtp_addition = vim.fn.stdpath('data') .. '/site/pack/*/start/*'
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
	end
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'gruvbox-community/gruvbox'

	use 'vim-airline/vim-airline'

	use 'ryanoasis/vim-devicons'

	use 'tpope/vim-commentary'

	use 'tpope/vim-surround'

	use 'jiangmiao/auto-pairs'

	use 'terryma/vim-multiple-cursors'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	}

	use 'sirver/ultisnips'

	use 'vim-autoformat/vim-autoformat'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
