#!/bin/bash

V8_REPO="http://github.com/v8/v8.git"
V8_DIR=v8

TICK_SCRIPT="bin/node-tick-processor"
TICK_FILES="
    header.js
    $V8_DIR/tools/splaytree.js
    $V8_DIR/tools/codemap.js
    $V8_DIR/tools/csvparser.js
    $V8_DIR/tools/consarray.js
    $V8_DIR/tools/profile.js
    $V8_DIR/tools/profile_view.js
    $V8_DIR/tools/logreader.js
    $V8_DIR/tools/tickprocessor.js
    $V8_DIR/tools/tickprocessor-driver.js
"
COPY_FILES="
    $V8_DIR/tools/mac-nm
"


function getv8() {
    if [ -d $V8_DIR ]; then return; fi
    echo "Cloning V8 source code..."
    git clone $V8_REPO $V8_DIR
    echo
}


function main() {
    getv8

    echo "Rebuilding tick processor..."
    echo "#!/usr/bin/env node" > $TICK_SCRIPT
    for file in $TICK_FILES; do
        echo "//----------------------------------------------------------------------" >> $TICK_SCRIPT
        echo "// FILE $file" >> $TICK_SCRIPT
        echo "//" >> $TICK_SCRIPT
        cat $file >> $TICK_SCRIPT
        echo >> $TICK_SCRIPT
    done
    chmod u+x $TICK_SCRIPT

    echo "Copying other files..."
    cp $COPY_FILES bin/

    echo "Done."
}
main



