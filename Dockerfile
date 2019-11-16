FROM remotepixel/amazonlinux:gdal3.0-py3.7

RUN pip install cython==0.28

# We can add pyproj too
RUN pip install \
    lambda-proxy~=5.0 \
    pyproj==2.4.1 \
    numpy \
    rasterio[s3] \
    requests \
    rio-cogeo \
    rio-color \
    rio-tiler \
    rio_tiler_mosaic \
    rio_tiler_mvt \
    shapely \
    supermercado \
    --no-binary rasterio,numpy,shapely,pyproj -t $PREFIX/python

ENV PYTHONPATH=$PYTHONPATH:$PREFIX/python
