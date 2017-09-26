# Extract imagename from run script
IMAGE=$(shell grep IMAGE= run | head -n 1 | cut -c 7-)

ifeq ($(DOCKER_OFFLINE),)
	docker_pull := --pull=true
endif

.PHONY: image
image:
	docker build \
		$(docker_pull) \
		-t ${IMAGE}:latest \
		-f Dockerfile .

push: image
	docker push ${IMAGE}:latest

run: image
	./run
