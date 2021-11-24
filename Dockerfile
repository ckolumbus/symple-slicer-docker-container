# syntax=docker/dockerfile:1
FROM bitnami/minideb:buster as builder
WORKDIR /app
RUN apt update &&  apt install -y npm python3-minimal git
RUN git clone https://github.com/SynDaverCO/symple-slicer.git && cd symple-slicer 
COPY ./patch/updater.js src-app/lib/util/ui/updater/updater.js
RUN  npm install

FROM bitnami/minideb:buster 
WORKDIR /app
RUN apt update && apt install -y python3-minimal
COPY --from=builder /app/symple-slicer ./

WORKDIR /app/src-app
CMD ["python3", "-m", "http.server", "80"]
