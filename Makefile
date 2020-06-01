# Makefile for scu_thesis_2020

# Basename of thesis
THESIS = MainBody

# Option for latexmk
LATEXMK_OPT = -quiet -file-line-error -halt-on-error -interaction=nonstopmode
LATEXMK_OPT_PVC = $(LATEXMK_OPT_BASE) -pvc

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY : all pdf pvc view wordcount clean cleanall FORCE_MAKE

all :clean pdf clean

pdf : $(THESIS).pdf

$(THESIS).pdf : $(THESIS).tex FORCE_MAKE
	@latexmk $(LATEXMK_OPT) $<

pvc : $(THESIS).tex
	@latexmk $(LATEXMK_OPT_PVC) $(THESIS)

view : $(THESIS).pdf
	$(OPEN) $<

wordcount : $(THESIS).tex
	@texcount $< -inc -ch-only   | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}'; \

	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}'

clean :
	-@latexmk -c -silent $(THESIS).tex 2> /dev/null

cleanall :
	-@latexmk -C -silent $(THESIS).tex 2> /dev/null