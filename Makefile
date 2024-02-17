include .env
VERSION := $(shell git describe --tags --always)

debug:
	echo ${CONTAINER_REGISTRY_TAG}:${VERSION}

docker-image:
	docker build -t ${CONTAINER_REGISTRY_TAG}:latest -t ${CONTAINER_REGISTRY_TAG}:${VERSION} .

docker-push:
	docker push ${CONTAINER_REGISTRY_TAG}:${VERSION}
	docker push ${CONTAINER_REGISTRY_TAG}:latest
