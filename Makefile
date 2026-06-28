PACKAGE = exonot

TEX = pdflatex

.PHONY: all sty doc demo clean distclean ctan

all: sty doc

# Extract the .sty from the documented source.
sty: $(PACKAGE).sty

$(PACKAGE).sty: $(PACKAGE).dtx $(PACKAGE).ins
	tex $(PACKAGE).ins

# Typeset the package documentation (run twice for cross-references).
doc: $(PACKAGE).pdf

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty
	$(TEX) $(PACKAGE).dtx
	$(TEX) $(PACKAGE).dtx

# Build the demo document.
demo: $(PACKAGE).sty
	$(TEX) $(PACKAGE)-demo.tex
	$(TEX) $(PACKAGE)-demo.tex

# Build a CTAN-ready zip.
ctan: all
	rm -rf $(PACKAGE) $(PACKAGE).zip
	mkdir -p $(PACKAGE)
	cp $(PACKAGE).dtx $(PACKAGE).ins $(PACKAGE).pdf $(PACKAGE)-demo.tex README.md LICENSE $(PACKAGE)/
	zip -r $(PACKAGE).zip $(PACKAGE)
	rm -rf $(PACKAGE)

clean:
	rm -f *.aux *.log *.out *.toc *.idx *.ind *.ilg *.glo *.gls *.hd \
	      *.fls *.fdb_latexmk *.synctex.gz

distclean: clean
	rm -f $(PACKAGE).sty $(PACKAGE).pdf $(PACKAGE)-demo.pdf $(PACKAGE).zip
	rm -rf $(PACKAGE)
