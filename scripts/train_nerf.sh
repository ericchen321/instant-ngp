#!/bin/bash

dataset_name=$1
config_name=$2

# define shape names
if [ $dataset_name == "blender" ]; then
    data_dir="data/nerf/nerf_synthetic/"
    scene_names=(
        "chair"
        "drums"
        "ficus"
        "hotdog"
        "lego"
        "materials"
        "mic"
        "ship")
elif [ $dataset_name == "llff" ]; then
    data_dir="data/nerf/nerf_llff_data/"
        scene_names=(
        "fern"
        "flower"
        "fortress"
        "horns"
        "leaves"
        "orchids"
        "room"
        "trex")
else
    echo "Error! Dataset name not recognized"
    exit 1
fi

# define configs
if [ $config_name == "default" ]; then
    n_steps=31000
else
    echo "Error! Config name not recognized"
    exit 1
fi

for scene_name in ${scene_names[@]}; do
    work_dir="workspace/${config_name}_${dataset_name}_${scene_name}/"
    mkdir -p $work_dir

    python scripts/run.py \
    --scene $data_dir/$scene_name \
    --mode nerf \
    --save_snapshot $work_dir/$scene_name.msgpack \
    --save_mesh $work_dir/$scene_name.ply \
    --test_transforms $data_dir/$scene_name/transforms_test.json \
    --n_steps $n_steps \
    --train | tee $work_dir/$scene_name.log

    mv diff.png $work_dir
    mv out.png $work_dir
    mv ref.png $work_dir

    echo trained "${dataset_name}_${config_name}_${scene_name}"
done