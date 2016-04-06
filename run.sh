#!/bin/sh

rm -rf ./out
./runSootOnApk.sh $1 ./out
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ./devkey/my-release-key.keystore -storepass 123456 -keypass 123456 ./out/$(basename $1) release
