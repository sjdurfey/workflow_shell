#!/usr/bin/env bash

function printMVNGONOITShelp {
    echo "usage: wsh mvngoskipits"
}

function mvngonoits {
    if [[ $# != 0 ]]
    	then printMVNGONOITShelp
    		exit 1
    fi

    mvn -U --quiet clean install -DskipITs
}