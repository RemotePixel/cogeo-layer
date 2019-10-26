#!/bin/bash
echo "-----------------------"
echo "Creating lambda package"
echo "-----------------------"

version=$(python -c 'import sys; print(f"{sys.version_info[0]}.{sys.version_info[1]}")')
PYPATH=${PYTHONUSERBASE}/lib/python${version}/site-packages/
mv ${PYPATH}/* ${PYTHONUSERBASE}/
rm -rf ${PYTHONUSERBASE}/lib

echo "Remove uncompiled python scripts"
find ${PYTHONUSERBASE}/ -type f -name '*.pyc' | while read f; do n=$(echo $f | sed 's/__pycache__\///' | sed 's/.cpython-[2-3][0-9]//'); cp $f $n; done;
find ${PYTHONUSERBASE}/ -type d -a -name '__pycache__' -print0 | xargs -0 rm -rf
find ${PYTHONUSERBASE}/ -type f -a -name '*.py' -print0 | xargs -0 rm -f

echo "Create archive"
cd $PYTHONUSERBASE && zip -r9q /tmp/package.zip *