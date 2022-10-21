all: build push
.PHONY: build push

TAG = common/metersphere:v1.16.koenfix.2
DOCKER_REGISTRY = hub.worktrans.cn
# --no-cache
package:
	mvn clean package

build:package
	docker build -t $(DOCKER_REGISTRY)/$(TAG) .

push:
	docker push $(DOCKER_REGISTRY)/$(TAG)

clean:
	docker rmi $(DOCKER_REGISTRY)/$(TAG)
