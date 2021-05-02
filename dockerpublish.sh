#!/bin/bash
IMAGE_NAME='php_smtp_nginx'
IMAGE_OWNER='kimbtechnologies'

tag_versions=(
	"latest"
	"8-latest"
)

# login
if docker system info | grep -q "Username: $DOCKER_USERNAME"; then
	echo "Already logged in!"
else
	echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
fi;

# for each "version"
for i in "${!tag_versions[@]}";
do
	tag_version="${tag_versions[$i]}"

	name="$IMAGE_OWNER/$IMAGE_NAME:$tag_version"

	# build image
	docker build . \
		--build-arg "BASEIMAGE_TAG=$tag_version" \
		--tag $name

	# get and tag php version
	php_v=$(docker run -it --rm $name sh -c 'echo "$PHP_VERSION"')
	php_v=$(echo $php_v | grep -o '[0-9\.]*')
	docker tag "$name" "$IMAGE_OWNER/$IMAGE_NAME:php-$php_v"

	# push
	docker push "$IMAGE_OWNER/$IMAGE_NAME:php-$php_v"
	docker push "$name"
done;