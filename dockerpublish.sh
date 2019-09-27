#!/bin/bash
IMAGE_NAME='php_smtp_nginx'

echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t $IMAGE_NAME .
docker images

PHP_VERSION=$(docker run -it --rm $IMAGE_NAME sh -c 'echo "$PHP_VERSION"')
PHP_VERSION=$(echo $PHP_VERSION | grep -o '[0-9\.]*')

for TAG in "php-$PHP_VERSION" "latest"; do
	echo "Tagging Image as $TAG and pushing";
	docker tag $IMAGE_NAME "kimbtechnologies/$IMAGE_NAME:$TAG"
      docker push "kimbtechnologies/$IMAGE_NAME:$TAG"
done