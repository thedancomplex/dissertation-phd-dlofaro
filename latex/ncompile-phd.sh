rm *.bbl
rm *.aux
rm *.log
rm *.blg
rm *.out
thefile=dlofaro-dissertation-phd-2013
pdflatex $thefile.tex
bibtex $thefile.aux
pdflatex $thefile.tex
pdflatex $thefile.tex
