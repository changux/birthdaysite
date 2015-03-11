.PHONY: all build default release

default: release

all: build

build: 
	docker build --rm --force-rm -t docker:birthday .

release: build
	docker run --rm -it -e AWS_S3_BUCKET -e AWS_ACCESS_KEY -e AWS_SECRET_KEY docker:birthday
