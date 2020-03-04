
SICKRAGE_VERSION = 9.4.132
IMAGE_NAME = alexsavio/rpi-sickrage:$(SICKRAGE_VERSION)
TAG = $(SICKRAGE_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) bash

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)

docker-push:
	docker build -f Dockerfile -t $(IMAGE_NAME) .
	docker login -u alexsavio
	docker push $(IMAGE_NAME)
