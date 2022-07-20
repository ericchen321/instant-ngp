#!/bin/bash

logging_subdir="$1"
resolution="$2"

shape_names=(
    "airplane"
    "armadillo"
    "asian_dragon"
    "at-ot"
    "beard_man"
    "bimba"
    "camera"
    "cathedral"
    "david"
    "dragon"
    "dragon_warrior"
    "engine"
    "gear_shift"
    "guangong"
    "lion"
    "lunar_lander"
    "ninjago_city"
    "oak_tree"
    "thai_statue"
)

for shape_name in ${shape_names[@]}; do
    source scripts/eval_sdf.sh $shape_name default $logging_subdir $resolution
done