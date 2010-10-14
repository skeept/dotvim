all: 
	#pdflatex --synctex=-1 -src-specials -interaction=nonstopmode InformsAustin1
	pdflatex --synctex=-1 -src-specials  InformsAustin1


clean :
	        rm -f *.toc *.log *.aux *.nav *.out *.snm *.synctex

realclean : clean
	        rm -f InformsAustin1.pdf InformsAustin1.dvi
