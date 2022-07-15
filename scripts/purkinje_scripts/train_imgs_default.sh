#!/bin/bash

img_names=(
    "tokyo"
    "bath"
    "copenhagen"
    "hamburg"
    "hiroshima"
    "iss"
    "lake_valhalla"
    "mexico_city"
    "tenby"
    "kangxi"
    "lanting_xu"
    "requiem"
    "steeds_full"
    "summer"
    "suzhou_a"
    "suzhou_b"
    "suzhou_c"
    "suzhou_d"
    "suzhou_e"
    "tibet"
    "wang"
)

for img_name in ${img_names[@]}; do
    source scripts/train_img.sh $img_name default
done