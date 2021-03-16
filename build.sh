#! /bin/bash

if [ ! -d "deps" ]; then

    echo "Dependacies not found. Attempting to download..."

    mkdir -p deps/{gmod,openvr}

    # GMod Module Base
    pushd ./deps/gmod
    wget  https://github.com/Facepunch/gmod-module-base/archive/15bf18f369a41ac3d4eba29ee0679f386ec628b7.zip -O tmp.zip
    unzip ./tmp.zip -d tmp
    mv ./tmp/gmod-module-base-15bf18f369a41ac3d4eba29ee0679f386ec628b7/include/GarrysMod/Lua/* .
    rm  -rf ./tmp{,.zip}
    popd

    # Open VR
    pushd ./deps/openvr
    wget https://github.com/ValveSoftware/openvr/raw/823135df1783009cb468d0fc4190816254f7687d/headers/openvr.h -O openvr.h
    wget https://github.com/ValveSoftware/openvr/raw/823135df1783009cb468d0fc4190816254f7687d/lib/linux32/libopenvr_api.so -O openvr_api_linux32.so
    wget https://github.com/ValveSoftware/openvr/raw/823135df1783009cb468d0fc4190816254f7687d/lib/linux64/libopenvr_api.so -O openvr_api_linux64.so
    popd
fi


if [ ! -d "build" ]; then mkdir build

pushd build
cmake ..

make

popd

fi