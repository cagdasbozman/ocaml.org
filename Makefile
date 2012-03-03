# auto-generated ml/mli files
AUTOFILES = src/lib/OCamlOrg_Main.ml \
            src/lib/OCamlOrg_Main.mli

LANGS = en fr de es it ja

# build the website
web: build
	./build.native
	cp -a src/html/css en/
	cp -a src/html/img en/
	@echo "Create symlinks for languages:"
	@for l in $(filter-out en, $(LANGS)); do \
	  if test -d $$l; then \
	    echo -n " $$l"; \
	    ln --force -s ../en/css/ $$l/css; \
	    ln --force -s ../en/img/ $$l/img; \
	  fi; \
	done

setup.data: src/lib/OCamlOrg_Main.html \
  src/lib/OCamlOrg_Main.html.ml src/lib/OCamlOrg_Main.html.mli

# OASIS_START
# DO NOT EDIT (digest: bc1e05bfc8b39b664f29dae8dbd3ebbb)

SETUP = ocaml setup.ml

build: setup.data
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

test: setup.data build
	$(SETUP) -test $(TESTFLAGS)

all: 
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

uninstall: setup.data
	$(SETUP) -uninstall $(UNINSTALLFLAGS)

reinstall: setup.data
	$(SETUP) -reinstall $(REINSTALLFLAGS)

clean: 
	$(SETUP) -clean $(CLEANFLAGS)

distclean: 
	$(SETUP) -distclean $(DISTCLEANFLAGS)

setup.data:
	$(SETUP) -configure $(CONFIGUREFLAGS)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

# OASIS_STOP

# delete everything that is auto-generated
.PHONY: fresh
fresh: distclean
	rm -rf en
	rm -f $(AUTOFILES)
