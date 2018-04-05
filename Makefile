.PHONY: all data deps

all: deps data

data:
			Rscript scripts/download_data.R $(FORCE)
			
deps:
			Rscript scripts/packages.R 