test: test-vim test-neovim

test-vim: dependencies
	vim -u test/vimrc -c 'Vader! test/*.vader'

test-neovim: dependencies
	VADER_OUTPUT_FILE=/dev/stderr nvim -u test/vimrc -c 'Vader! test/*.vader' --headless

dependencies:
	test -L pack/testing/start/vim-textobj-matchit && exit 0; \
	mkdir -p pack/testing/start; \
	cd pack/testing/start; \
	git clone https://github.com/junegunn/vader.vim.git; \
	git clone https://github.com/jwalton512/vim-blade.git; \
	git clone https://github.com/kana/vim-textobj-user.git; \
	ln -s ../../.. vim-textobj-matchit

clean:
	rm -rf pack

.PHONY: test test-vim test-neovim dependencies clean
