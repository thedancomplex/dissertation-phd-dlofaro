

BASEFILES := $(basename $(shell find -name '*.dat'))

default: $(addsuffix .pdf, $(BASEFILES))

all: default $(addsuffix .eps, $(BASEFILES))

png: $(addsuffix .png, $(BASEFILES))

%.png: %.pdf
	convert $< $@

%.eps: %.dat
	./plot.sh $<

%.pdf: %.eps
	epstopdf $<

clean:
	find -name '*.eps' -exec rm '{}' ';'
	find -name '*.pdf' -exec rm '{}' ';'
	find -name '*.png' -exec rm '{}' ';'
