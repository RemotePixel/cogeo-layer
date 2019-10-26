SHELL = /bin/bash

layer:
	docker build --tag remotepixel/amazonlinux:gdal3.0-py3.7-cogeo .
	docker run \
		--name lambda \
		-w /var/task \
		--volume $(shell pwd)/:/local \
		-itd remotepixel/amazonlinux:gdal3.0-py3.7-cogeo \
		bash
	docker exec -it lambda bash '/local/scripts/create-lambda-layer.sh'	
	docker cp lambda:/tmp/package.zip gdal3.0-py3.7-cogeo.zip
	docker stop lambda
	docker rm lambda

clean:
	docker stop lambda
	docker rm lambda
