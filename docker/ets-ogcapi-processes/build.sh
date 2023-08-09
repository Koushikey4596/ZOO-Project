#!/usr/bin/env bash

cd docker/ets-ogcapi-processes
curl -L -o 5.5.2.zip https://github.com/opengeospatial/teamengine/archive/refs/tags/5.5.2.zip
unzip 5.5.2.zip
mv teamengine-5.5.2 src

git clone https://github.com/opengeospatial/ets-common.git src1
cd src1
git clone https://github.com/opengeospatial/ets-ogcapi-processes10.git
git clone https://github.com/opengeospatial/ets-wps20.git

cd ../../..

docker build . -f docker/ets-ogcapi-processes/Dockerfile --progress plain -t zooproject/ets-ogcapi-processes10:latest

sed "s=<organization>=<config><organization>=g;s=</organization>=</organization></config>=g" -i docker/ets-ogcapi-processes/src1/ets-ogcapi-processes10/src/main/config/teamengine/config.xml