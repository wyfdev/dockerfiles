NAMESPACE := wyfio
BASE_IMG := ${NAMESPACE}/ubuntu


test:
	@echo ${BASE_IMG}

#
# base
#
base:
	docker build -t ${BASE_IMG} ubuntu


#
# developing docker envs
#

python:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg python_version=3 \
		-t ${NAMESPACE}/python:3 \
		-f python/Dockerfile \
		.

nodejs18:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg node_version=18 \
		-t ${NAMESPACE}/nodejs:18 \
		-f nodejs/Dockerfile \
		.

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

.PHONY: *
