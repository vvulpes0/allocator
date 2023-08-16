.SUFFIXES : .c .gv .html .nw .o .pdf .png .tex
.MAIN : all

.gv.png :
	dot -Tpng $< > $@
.gv.pdf :
	dot -Tpdf $< > $@

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

.nw.tex:
	noweave -delay -filter btdefn -t4 -index $< > $@

.nw.html:
	noweave -filter l2h -filter btdefn -index -html $< | htmltoc > $@

.tex.pdf:
	pdflatex '\scrollmode \input '"$*"; \
	while grep -s 'Rerun to get cross-references right' $*.log; \
	do pdflatex '\scrollmode \input '"$*"; done

.PHONY : all
all : allocator.html allocator.pdf test

allocator.c : allocator.nw
	notangle -filter btdefn -R$@ $> > $@

test.c : allocator.nw
	notangle -filter btdefn -R$@ $> > $@

test : test.o allocator.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $> $(LDLIBS)

allocator.html : allocator.nw pbt.png pbt-addr.png
allocator.pdf : allocator.tex pbt.pdf pbt-addr.pdf
