#!/usr/bin/env bash

function printMVNGOSKIPITShelp {
    echo "usage: wsh mvndependency"
}

function mvndependency {
    if [[ $# != 0 ]]
    	then printMVNDEPENDENCYhelp
    		exit 1
    fi

    mvn dependency:analyze
}