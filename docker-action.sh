#!/usr/bin/env bash

platforms="linux/amd64,linux/arm64"

docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --use --name builder
docker buildx inspect --bootstrap builder

dockerfiles=$(find . -name Dockerfile)

for df in $dockerfiles
do
  docker_image=$(echo "$df" | awk -F "/" '{print $(NF-2)"-"$(NF-1)}')
  echo "Building $docker_image"
  docker buildx build --platform $platforms -t pflookyy/"$docker_image":latest --push "$df"
done

echo "Done!"