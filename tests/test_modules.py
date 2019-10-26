"""test modules."""

import lambda_proxy
import pyproj
import numpy
import rasterio
import requests
import rio_cogeo
import rio_color
import rio_tiler
import rio_tiler_mosaic
import rio_tiler_mvt
import shapely
import supermercado

assert lambda_proxy.version
assert pyproj.__version__
assert numpy.__version__
assert rasterio.__version__
assert requests.__version__
assert rio_cogeo.version
assert rio_color.__version__
assert rio_tiler.version
assert rio_tiler_mosaic.version
assert rio_tiler_mvt.__version__
assert shapely.__version__
assert supermercado.__package__
