NAME       := privatebin
TAG        := `git describe --long --tags --dirty --always`
IMAGE_NAME := panubo/$(NAME)

.PHONY: build push clean
build:
	docker build --pull -t $(IMAGE_NAME):$(TAG) .

push:
	# Don't --pull here, we don't want any last minute upsteam changes
	docker build -t $(IMAGE_NAME):$(TAG) .
	docker tag $(IMAGE_NAME):$(TAG) $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(TAG)
	docker push $(IMAGE_NAME):latest

clean:
	docker rmi $(IMAGE_NAME):$(TAG)
