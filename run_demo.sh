#!/usr/bin/env sh
set -ex

seed2lp network sbml/toy-model.xml sbml-norm/ -wf

netseedpy --sbml sbml-norm/toy-model.xml \
    --format enumeration --max 100

seed2lp target sbml/toy-model.xml results/s2lp/toy-model/ \
    -so reasoning -m subsetmin -nbs 5 -tl 10 \
    --accumulation

seed2lp target sbml/toy-model.xml results/s2lp/toy-model/ \
    -so guess_check_div -m subsetmin \
    -nbs 100 -tl 10 \
    --accumulation

python ./scripts/cobra_seedsearch/cobra_seedsearch.py \
        ./sbml/toy-model.xml ./target/toy-model_targets.txt \
        ./objective/toy-model_target.txt \
        ./results/cobrapy 1

python -m json.tool ./results/cobrapy/toy-model/toy-model_cobrapy_results.json

