#! /bin/bash

# define shape names
declare -a scene_names=(
    "chair"
    "drums"
    "ficus"
    "hotdog"
    "lego"
    "materials"
    "mic"
    "ship")

for scene_name in ${scene_names[@]}; do
    mkdir -p workspace/$scene_name

    python scripts/run.py \
    --scene data/nerf/nerf_synthetic/$scene_name \
    --mode nerf \
    --save_snapshot workspace/$scene_name/$scene_name.msgpack \
    --save_mesh workspace/$scene_name/$scene_name.ply \
    --test_transforms data/nerf/nerf_synthetic/$scene_name/transforms_test.json \
    --n_steps 31000 \
    --train | tee workspace/$scene_name/$scene_name.log

    mv diff.png workspace/$scene_name/
    mv out.png workspace/$scene_name/
    mv ref.png workspace/$scene_name/

    echo trained $scene_name
done