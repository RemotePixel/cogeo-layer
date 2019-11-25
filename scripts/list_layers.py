
import json
from boto3.session import Session as boto3_session

regions = ["us-east-1", "us-east-2", "us-west-1", "us-west-2", "eu-central-1"]
layers = ["gdal24-py37-cogeo", "gdal30-py37-cogeo"]


def main():
    results = []
    for region in regions:
        res = {"region": region, "layers": []}

        session = boto3_session(region_name=region)
        client = session.client("lambda")
        for layer in layers:
            response = client.list_layer_versions(
                CompatibleRuntime="python3.7",
                LayerName=layer,
            )
            latest = response["LayerVersions"][0]
            res["layers"].append(dict(
                name=layer,
                arn=latest["LayerVersionArn"],
                version=latest["Version"]
            ))
        results.append(res)

    print(json.dumps(results))


if __name__ == '__main__':
    main()
