PROJECTNAME=BScThesis

.PHONY: all clean osx

all:
	@echo $(PATH)
	@echo "Building project:" $(PROJECTNAME)
	mkdir -p out out/include out/chapters pdf
	cd tex; latexmk -pdf -outdir=../out -jobname=$(PROJECTNAME) main
	mv out/$(PROJECTNAME).pdf pdf/$(PROJECTNAME)-uncompressed.pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=pdf/$(PROJECTNAME).pdf pdf/$(PROJECTNAME)-uncompressed.pdf

jenkins: clean all

osx: all
	open -a Skim pdf/$(PROJECTNAME).pdf

clean:
	@echo "Cleaning project:" $(PROJECTNAME)
	rm -rf ./out
	rm -rf ./pdf
