NAME       := privatebin
IMAGE_NAME := panubo/$(NAME)
VERSION    := $(shell sed -E -e '/PRIVATEBIN_VERSION[ |=|v]+[0-9\.]+/!d' -e 's/.*PRIVATEBIN_VERSION[ |=|v]+([0-9\.]+).*/\1/' Dockerfile)

.PHONY: build push clean
build:
	docker build --pull -t $(IMAGE_NAME):$(VERSION) .

push:
	docker push $(IMAGE_NAME):$(VERSION)

clean:
	docker rmi $(IMAGE_NAME):$(VERSION)
