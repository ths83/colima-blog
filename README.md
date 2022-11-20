# Colima testing scripts

Colima testing scripts for Kumojin's blog.

## Running tests

### Using bind mount volume

```shell
docker run -v $(pwd)/:/test/ --workdir /test alpine sh test.sh host
```

### Using Docker volume

```shell
docker volume create test_volume
docker build -t colima_test .
docker run -v test_volume:/test/ --workdir /test colima_test test.sh volume
```

### Using a container

```shell
docker build -t colima_test .
docker run colima_test container
```
