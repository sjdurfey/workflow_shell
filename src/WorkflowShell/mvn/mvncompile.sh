#!/usr/bin/env bash

function printMVNCOMPILEhelp {
    echo "usage: wsh mvncompile"
}

function mvncompile {
    if [[ $# != 0 ]]
    	then printMVNCOMPILEhelp
    		exit 1
    fi

    mvn -U -T 2C --quiet clean compile test-compile
}