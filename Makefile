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
