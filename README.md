This is project build a [Scylla](scylladb.com)+[KairosDB](kairosdb.github.io) standalone Docker image base on [Scylla Docker image](https://hub.docker.com/r/scylladb/scylla/).

### Usage

Run
```
sudo docker run --name some-scylla-kairos -d tzachl/scylla-and-kairosdb
```

Run CQLsh
```
sudo docker exec -it some-scylla-kairos cqlsh
```

Run nodetool
```
sudo docker exec -it some-scylla-kairos nodetool status
```

Get container IP

```
export IP=$(sudo docker inspect --format='{{ .NetworkSettings.IPAddress }}' some-scylla-kairos)
```

Insert Metrics
```
curl -XPOST "http://$IP:8080/api/v1/datapoints/query" -d '
{
  "metrics": [
    {
      "tags": {
        "sensor_id": "sid1"
      },
      "name": "sensor.temp.1min"
    },
    {
      "tags": {
        "sensor_id": "sid2"
      },
      "name": "sensor.temp.1min"
    }
  ],
  "cache_time": 0,
  "start_relative": {
    "value": "1",
    "unit": "days"
  }
}
'
```

Query metrics
```
curl -XGET "http://$IP:8080/api/v1/metricnames"
curl -XGET "http://$IP:8080/api/v1/tagnames"
curl -XGET "http://$IP:8080/api/v1/tagvalues"
```

See [Scylla Docker Image how to](https://hub.docker.com/r/scylladb/scylla/) for more Scyla options.
