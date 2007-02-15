# top-level Makefile for the entire tree.
%:
	@for i in $(filter-out extlibs/ utils/ licenses/,$(wildcard */)) ; do \
		$(MAKE) -C $$i $* ; \
	done

paranoid-%:
	@for i in $(filter-out misc/ utils/ licenses/,$(wildcard */)) ; do \
		$(MAKE) -C $$i $@ || exit 2; \
	done

export BUILDLOG ?= $(shell pwd)/buildlog.txt

unbuilt:
	@(find . -mindepth 3 -maxdepth 3 -name work | cut -d/ -f 3; find . -mindepth 2 -maxdepth 2 | cut -d/ -f3) | sort | uniq -u

report-%:
	@echo "$@ started at $$(date)" >> $(BUILDLOG)
	@for i in $(filter-out CVS/ broken/ bootstrap/ evolution/ pwlib/,$(wildcard */)) ; do \
		$(MAKE) -C $$i $@ || echo "	make $@ in category $$i failed" >> $(BUILDLOG); \
	done
	@echo "$@ completed at $$(date)" >> $(BUILDLOG)

.PHONY: unbuilt
