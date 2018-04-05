.PHONY: all data

all: data

data:
			Rscript scripts/download_data.R $(FORCE)