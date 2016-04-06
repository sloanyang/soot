#!/bin/bash

ANDROID_JARS_PATH="/home/sloanyang/bin/android-sdk-linux/platforms/"
JAVA_CLASSPATH="\
/home/sloanyang/autobuild/releases/soot-trunk.jar:\
/home/sloanyang/autobuild/tmp/libs/jasmin-custom.jar:\
/home/sloanyang/autobuild/tmp/libs/java_cup.jar:\
"

APK_FILE=$1
SOOT_OUT_DIR=$2

PROCESS_THIS=" -process-dir $APK_FILE" 
SOOT_CLASSPATH="\
"${APK_FILE}":\
"

SOOT_CMD="soot.tools.AndroidInstrument \
 -d $SOOT_OUT_DIR \
 -android-jars $ANDROID_JARS_PATH \
 -allow-phantom-refs \
 -src-prec apk \
 -ire \
 -f J \
 $PROCESS_THIS
"

java \
 -Xss50m \
 -Xmx1500m \
 -classpath  ${JAVA_CLASSPATH} \
 ${SOOT_CMD}\
