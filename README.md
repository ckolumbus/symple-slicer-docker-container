# Docker Container for Symple-Slicer

This is a simple docker file to creat an image with the 
very cool [symple-slicer] web based slicing frontend using
[CuraEngine] as backend.

## Features

* local persistnat configuration volume
* disabled auto-update features to prevent 
  error popup on startup
* small size (150Mb) due to using docker multi-stage build
  and `bitnami/minideb` as base image

## How to build

```sh
docker build -t ckolumbus/symple-slicer .
```

## How to run

```sh
docker run -p 8080:80 -v ./config:/app/src-app/config ckolumbus/symple-slicer
```

[symple-slicer]: https://github.com/SynDaverCO/symple-slicer
[CuraEngine]: https://github.com/Ultimaker/CuraEngine
