#!/bin/bash

# Get arguments
while getopts s: flag
do
    case "${flag}" in
        s) SPECIES=${OPTARG};;
        *) echo "Invalid OPTION" && exit 1;;
    esac
done



    SPECIES_RESULT_DIR="./results/s2lp/$SPECIES"
    SBML_FILE="./sbml/$SPECIES.xml"
    OUT_DIR="./results/analysis"

    if [[ ! -d "$OUT_DIR" ]]
    then
    	mkdir -p "$OUT_DIR"
    fi

    python ./scripts/met_get/met_get.py $SPECIES_RESULT_DIR $SBML_FILE $OUT_DIR
