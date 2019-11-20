"""test modules."""

import lambda_proxy

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

from rasterio.env import GDALVersion

if not GDALVersion.runtime().at_least("3.0"):
    import pyproj


def test_modules():
    """Test we can import modules."""
    assert lambda_proxy.version
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

    if not GDALVersion.runtime().at_least("3.0"):
        assert pyproj.__version__
