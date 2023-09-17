prefix ?= /usr/local
bindir = $(prefix)/bin
binname = "codemaster"

build:
	swift build -c release --disable-sandbox

install: build
	install -d "$(bindir)"
	install ".build/release/$(binname)" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/$(binname)"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
