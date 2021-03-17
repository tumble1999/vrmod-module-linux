#! /bin/bash


wget  https://github.com/tumble1999/vrmod-module-linux/archive/master.zip -O vrmod.zip
unzip ./vrmod.zip -d vrmod
mv ./vrmod/vrmod-module-linux-master/install/GarrysMod/garrysmod/lua/bin/* .
rm  -rf ./vrmod{,.zip}

echo "Update script finished, check above for errors."