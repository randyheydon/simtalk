# Inputs.
PANDOC=pandoc
INPUT=presentation.mkd

# Outputs.
PRESENTATION=presentation.html
WEBPAGE=webpage.html


all: presentation webpage

# TODO maybe:
#	--incremental
#	-V theme=something
#	--template=file
#	--self-contained
#	--bibliography=content/sources.bib
#	--csl=content/ieee.csl
presentation: $(INPUT)
	$(PANDOC) -t revealjs\
	          -V revealjs-url=content/reveal.js\
	          --smart\
	          --standalone\
	          -o $(PRESENTATION) $(INPUT)

webpage: $(INPUT)
	$(PANDOC) -t html\
	          --smart\
	          --standalone\
	          -o $(WEBPAGE) $(INPUT)

clean:
	rm -f $(PRESENTATION) $(WEBPAGE)
