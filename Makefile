prefix ?= /usr/local
script_target = $(DESTDIR)$(prefix)/bin/git-unrealmodule
source_dir = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

noop:
	# no build needed

install:
	install -m 655 git-unrealmodule $(script_target)

# For development
install-symlink:
	ln -s  $(source_dir)/git-unrealmodule $(script_target)

uninstall:
	rm -f $(script_target)

update-readme:
	sed -i  -n '/## Command documentation/q;p' README.md
	echo "## Command documentation\n" >> README.md
	echo 'From `--help`' >> README.md
	echo '```' >> README.md
	./git-unrealmodule help >> README.md
	echo '```' >> README.md
	git commit README.md -m "Update readme from --help"
