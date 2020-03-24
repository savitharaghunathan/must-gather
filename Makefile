IMAGE_REGISTRY ?= quay.io
IMAGE_TAG ?= latest
IMAGE_NAME ?= konveyor/must-gather

build: docker-build docker-push

docker-build:
	docker build -t ${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} .

docker-push:
	docker push ${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

.PHONY: build docker-build docker-push
