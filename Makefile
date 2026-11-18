PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin

.PHONY: install uninstall check

install:
	@mkdir -p $(BINDIR)
	@install -m 0755 bin/hypershell-agent $(BINDIR)/hypershell-agent
	@echo "Installed $(BINDIR)/hypershell-agent"

uninstall:
	@rm -f $(BINDIR)/hypershell-agent
	@echo "Removed $(BINDIR)/hypershell-agent"

check:
	@bash -n bin/hypershell-agent
	@bin/hypershell-agent --help >/dev/null
	@echo "Checks passed"
