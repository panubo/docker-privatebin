NAME       := privatebin
TAG        := latest
IMAGE_NAME := panubo/$(NAME)

.PHONY: *

build:
	docker build --pull -t $(IMAGE_NAME):$(TAG) .

push:
	docker push $(IMAGE_NAME):$(TAG)

clean:
	docker rmi $(IMAGE_NAME):$(TAG)

run:
	docker run --rm -t -i -P $(IMAGE_NAME):$(TAG)

bash:
	docker run --rm -t -i -P --entrypoint /bin/bash $(IMAGE_NAME):$(TAG)

_ci_test:
	true
