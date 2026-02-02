#!/usr/bin/env sh
set -x

seed2lp network sbml/iCN718.xml sbml-norm/ -wf

netseedpy --sbml sbml-norm/iCN718.xml \
    --format enumeration --max 100

seed2lp target sbml/iCN718.xml results/s2lp/iCN718/ \
    -so reasoning -m subsetmin -nbs 100 -tl 10 \
    --accumulation

seed2lp target sbml/iCN718.xml results/s2lp/iCN718/ \
    -so guess_check_div -m subsetmin \
    -nbs 100 -tl 10 --accumulation


