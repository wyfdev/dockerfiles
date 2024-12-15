NAMESPACE := wyfio
BASE_IMG := ${NAMESPACE}/ubuntu


show-base-image:
	@echo "Base image: ${BASE_IMG}"

#
# base
#
base:
	docker build -t ${BASE_IMG} -f base/Dockerfile.ubuntu base


#
# developing docker envs
#

python-latest:
	@$(eval PY_VERSION := $(shell  \
			curl -sL https://api.github.com/repos/python/cpython/tags | \
			jq -r ".[].name" | \
			grep -Po -m 1 "^v\d+\.\d+\.\d+$$"))
	@echo "Found the Latest Python Version: [${PY_VERSION}]"
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg PYTHON_VERSION=${PY_VERSION} \
		-t ${NAMESPACE}/python:latest \
		-f python/Dockerfile.build \
		.

python3:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg python_version=3 \
		-t ${NAMESPACE}/python:3 \
		-f python/Dockerfile \
		.

go golang:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		-t ${NAMESPACE}/golang \
		-f golang/Dockerfile \
		.

rust:
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		-t ${NAMESPACE}/rust \
		-f rust/Dockerfile \
		.

nodejs20:
	# Lastest version 20.* version is:
	@$(eval NODE_VERSION := $(shell  \
			curl -sL https://api.github.com/repos/nodejs/node/tags | \
			jq -r ".[].name" | \
			grep -Po -m 1 "^v20\.\d+\.\d+$$"))
	#   $(NODE_VERSION)
	docker build \
		--build-arg BASE_IMG=${BASE_IMG} \
		--build-arg node_version=${NODE_VERSION} \
		-t ${NAMESPACE}/nodejs:20 \
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


#
# alternative base image
#
fedora:
	docker build -t ${NAMESPACE}/fedora -f base/Dockerfile.fedora base


.PHONY: *
