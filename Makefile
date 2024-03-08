AUTHORS = $(shell head -1 LICENSE |cut -d\  -f3-)

SRC = $(notdir $(wildcard src/*))
OBJ = build/obj/iaria.ins build/obj/iaria.dtx
DOC_PDF = build/doc/iaria.pdf
TEMPLATE_PDFS = $(patsubst %.tex,build/doc/%.pdf,$(notdir $(wildcard static/iaria-example-neumann/*.tex)))
LICENSE = build/dist/COPYING
ARCHIVE = dist/iaria.zip
#LICENSE_TEXT = $(shell cat LICENSE)
LICENSE_TEXT = LICENSEDUMMY

VPATH = src

LATEX = latexmk -latexoption=-interaction=nonstopmode -latexoption=-halt-on-error -pdf
MAKEDTX = build/tools/makedtx/makedtx.pl
MAKEDTX_ARCHIVE = makedtx-1_2.zip

default: compile

compile: $(OBJ) $(DOC_PDF) $(TEMPLATE_PDFS)

dist : $(ARCHIVE)

$(ARCHIVE) : $(OBJ) $(DOC_PDF) $(TEMPLATE_PDFS) $(LICENSE)
	mkdir -p build/dist
	cp -r static/* build/dist
	cp $(OBJ) $(DOC_PDF) build/dist
	mkdir -p build/dist/template
	cp $(TEMPLATE_PDFS) build/dist/template
	mkdir -p dist
	cd build/dist; zip -r ../../$@ *

# Extract makedtx.pl
$(MAKEDTX) : dependencies/$(MAKEDTX_ARCHIVE)
	mkdir -p build/tools
	cd build/tools; unzip -o ../../$<
	cd build/tools/makedtx; latex makedtx.ins

# build dtx and ins files
$(OBJ) : $(SRC) $(MAKEDTX)
	mkdir -p build/obj
	perl $(MAKEDTX) \
		-macrocode ".*" \
		-src "($(subst $() $(),|,$(SRC)))=>\1" \
		-dir "src" \
		-author "$(AUTHORS)" \
		-date "2023-$(shell date +%Y)" \
		-setambles ".*=>\nopreamble" \
		-doc "doc/iaria.tex" \
		-preamble "$(LICENSE_TEXT)" \
		iaria
	sed -e "$$(($$(wc -l < iaria.ins)-1))r patch/msg.txt" iaria.ins
	mv $(notdir $(OBJ)) build/obj

# Build iaria-example-neumann PDFs
build/doc/%.pdf : static/iaria-example-neumann/%.tex
	mkdir -p build/doc
	cp $< static/iaria-example-neumann/Makefile static/iaria-example-neumann/*.cls build/doc
	$(MAKE) -C build/doc $(notdir $@)

# Build Documentation PDF from iaria.dtx
$(DOC_PDF) : build/obj/iaria.dtx
	mkdir -p build/doc
	cp $< build/doc
	cd build/doc; $(LATEX) iaria.dtx

$(LICENSE) : LICENSE
	mkdir -p build/dist
	cp $^ $@

clean:
	rm -rf build
	rm -rf dist

.PHONY: default compile dist clean