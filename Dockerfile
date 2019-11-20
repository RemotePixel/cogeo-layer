ARG GDAL_VERSION
FROM remotepixel/amazonlinux:gdal${GDAL_VERSION}-py3.7

ARG GDAL_VERSION
ENV GDAL_VERSION $GDAL_VERSION

RUN pip install cython==0.28

COPY requirements-gdal${GDAL_VERSION}.txt requirements.txt
RUN pip install -r requirements.txt --no-binary :all: -t $PREFIX/python

ENV PYTHONPATH=$PYTHONPATH:$PREFIX/python
