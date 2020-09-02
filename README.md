# CAM must-gather

`must-gather` is a tool built on top of [OpenShift must-gather](https://github.com/openshift/must-gather)
that expands its capabilities to gather CAM specific resources

### Usage
```sh
oc adm must-gather --image=quay.io/konveyor/must-gather:latest
```

The command above will create a local directory with a dump of the CAM state.

You will get a dump of:
- All namespaces where a CAM toolset is installed, including pod logs
- All velero.io and migration.openshift.io resources located in those namespaces
- Prometheus metrics

#### Preview metrics on local Prometheus server

Get Prometheus metrics data directory dump (last day, might take a while):
```sh
oc adm must-gather --image quay.io/konveyor/must-gather:latest -- /usr/bin/gather_metrics_dump
```

Run local Prometheus instance with dumped data:
```sh
make prometheus-run # and prometheus-cleanup when you're done
```
The latest Prometheus data file (prom_data.tar.gz) in current directory/subdirectories is searched by default. Could be specified in ```PROMETHEUS_DUMP_PATH``` environment variable.

### Development
You can build the image locally using the Dockerfile included.

A `makefile` is also provided. To use it, you must pass a repository via the command-line using the variable `IMAGE_NAME`.
You can also specify the registry using the variable `IMAGE_REGISTRY` (default is [quay.io](https://quay.io)) and the tag via `IMAGE_TAG` (default is `latest`).

The targets for `make` are as follows:
- `build`: builds the image with the supplied name and pushes it
- `docker-build`: builds the image but does not push it
- `docker-push`: pushes an already-built image

For example:
```sh
make build IMAGE_NAME=my-repo/must-gather
```
would build the local repository as `quay.io/my-repo/must-gather:latest` and then push it.
