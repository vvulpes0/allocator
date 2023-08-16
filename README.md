# Allocator

An implementation of a simple memory allocator, and some discussion.

![sample run of the test program](sample-run.png)

## Building

You'll need some tools:

* [`noweb`][1] to extract the source code
* [Graphviz][2] to see trees in the documentation
* [LaTeX][3] for PDF output
* and some kind of C compiler and a `make` program

Ideally: just run `make`.
As output, you'll find `allocator.html` and `allocator.pdf`,
the written discussion in two formats.
You will also find the extracted C source code,
various object files, and a program called `test`.
The latter was used to generate the image in this document.

[1]: https://github.com/nrnrnr/noweb/tree/master
[2]: https://graphviz.org
[3]: https://www.latex-project.org
