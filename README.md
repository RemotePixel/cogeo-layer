# cogeo-layer

[![CircleCI](https://circleci.com/gh/RemotePixel/cogeo-layer.svg?style=svg)](https://circleci.com/gh/RemotePixel/cogeo-layer)

#### Python package

```
lambda-proxy~=5.0
numpy
pyproj==2.4.1 (only with GDAL 3.0)
rasterio[s3]
requests
rio-cogeo
rio-color
rio-tiler
rio_tiler_mosaic
rio_tiler_mvt
shapely
supermercado
```

#### Arns

`arn:aws:lambda:{REGION}:524387336408:layer:gdal{GDAL_VERSION_NODOT}-py37-cogeo:{LAYER_VERSION}}`

#### Regions
- us-east-1
- us-east-2
- us-west-1
- us-west-2
- eu-central-1

#### Version

##### GDAL 3.0
- Layer Version: **3**
- Package size: 34.9Mb (110Mb)
- Python Version: 3.7.2
- GDAL Version: 3.0.2
- PROJ Version: 6.2.1

##### GDAL 2.4
- Layer Version: **1**
- Package size: 32.8Mb (106Mb)
- Python Version: 3.7.2
- GDAL Version: 2.4.3
- PROJ Version: 6.2.1

## How To

### Create package

#### Simple app (no dependency)

```bash
zip -r9q /tmp/package.zip app.py
```

#### Complex (dependencies)

- Create a docker file 
```dockerfile
FROM remotepixel/amazonlinux:gdal3.0-py3.7-cogeo

ENV PYTHONUSERBASE=/var/task

# Install dependencies
COPY handler.py $PYTHONUSERBASE/handler.py
RUN pip install mercantile --user

RUN mv ${PYTHONUSERBASE}/lib/python3.7/site-packages/* ${PYTHONUSERBASE}/
RUN rm -rf ${PYTHONUSERBASE}/lib

echo "Create archive"
RUN cd $PYTHONUSERBASE && zip -r9q /tmp/package.zip *
``` 

- create package
```bash
docker build --tag package:latest .
docker run --name lambda -w /var/task -itd package:latest bash
docker cp lambda:/tmp/package.zip package.zip
docker stop lambda
docker rm lambda
```
