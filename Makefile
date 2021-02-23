BUILD_AT := local
# BUILD_AT := gcloud

NAMESPACE := wyfio
# NAMESPACE := wyfdev

ifeq (${BUILD_AT}, gcloud)
BUILD_AT = gcloud
BASE_IMG := gcr.io/wyf-io/ubuntu:20.04
else
BUILD_AT = local
BASE_IMG := ${NAMESPACE}/ubuntu:20.04
endif


#
# base
#
base: base-${BUILD_AT}

base-local:
	docker build -t ${BASE_IMG} ubuntu

base-gcloud:
	gcloud builds submit --tag ${BASE_IMG} ubuntu


#
# developing docker envs
#

flutter-web: flutter
	docker build \
		--build-arg BASE_IMG=${NAMESPACE}/flutter-base \
		-t ${NAMESPACE}/flutter-web \
		-f flutter/Dockerfile.web \
		.

flutter:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		-t ${NAMESPACE}/flutter-base \
		-f flutter/Dockerfile .

python:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg python_version=3 \
		-t ${NAMESPACE}/python:3 \
		-f python/Dockerfile \
		.

nodejs14: 
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg node_version=14 \
		-t ${NAMESPACE}/nodejs:14 \
		-f nodejs/Dockerfile \
		.

.PHONY: *