GPGARMOURDIR   := gpg-asc
GPGUNARMOURDIR := gpg

GPGARMOURED := $(wildcard $(GPGARMOURDIR)/*.asc)
GPGUNARMOUR := $(GPGARMOURED:$(GPGARMOURDIR)/%.asc=$(GPGUNARMOURDIR)/%.gpg)

all: $(GPGUNARMOUR)

$(GPGUNARMOURDIR)/%.gpg: $(GPGARMOURDIR)/%.asc $(GPGUNARMOURDIR)
	gpg --dearmor < $< > $@

$(GPGUNARMOURDIR):
	mkdir -p $@

clean:
	[ -d $(GPGUNARMOURDIR) ] && rm $(GPGUNARMOURDIR) -rf || true

.PHONY: all clean
