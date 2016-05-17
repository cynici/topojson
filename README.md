# Topojson in Docker

This repo avails the commandline tool, [topojson](https://github.com/mbostock/topojson/wiki/Command-Line-Reference) in a docker image.

The sample ENTRYPOINT script *docker-entrypoint.sh* provided uses [gosu](https://github.com/tianon/gosu) to switch user so that subsequent processes are run as non-root user.


## Usage

* docker-compose.yml

Use the example below and tailor it for your needs. Replace the placeholder *{}* with the correct value.

If you're using *docker-entrypoint.sh*, you can override the container runtime numeric user-id to your own by setting the environment variable *RUNUSER_UID* to avoid input/output file permission issue. The script sets the runtime user home directory and current working directory to /data by default. It can be changed using the environment variable *RUNUSER_HOME*.

```
version: '2'
services:
  topojson:
    build:
      context: .
    environment:
    - RUNUSER_UID=1000
    - RUNUSER_HOME=/data
    volumes:
    - ./docker-entrypoint.sh:/docker-entrypoint.sh:ro
    - {path_to_data_directory}:/data
    entrypoint:
    - /docker-entrypoint.sh
    command:
    - topojson
    - --quantization=1e5
    - --out=output.json
    - input.json 
```

In this example, both the input and output files are to be found in *{path_to_data_directory}* (mapped to /data/\* within the container).

```
docker-compose -f docker-compose.yml up
```
