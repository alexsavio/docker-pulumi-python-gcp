GCP_SDK_VERSION = 297.0.1
IMAGE_NAME ?= alexsavio/pulumi-gcp-python:$(GCP_SDK_VERSION)
TAG = $(GCP_SDK_VERSION)

build:
	docker build --build-arg GCP_SDK_VERSION=${GCP_SDK_VERSION} -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

tag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
