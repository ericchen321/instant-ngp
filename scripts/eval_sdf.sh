#!/bin/bash

shape_name=$1
config_name=$2
logging_subdir=$3
resolution=$4

# define configs
if [ $config_name == "default" ]; then
    n_steps=11000
else
    echo "Error! Config name not recognized"
    exit 1
fi

work_dir="workspace/$logging_subdir/${config_name}_${shape_name}/"
mkdir -p $work_dir
data_dir="data/sdf/ours/"

set -x
python scripts/run.py \
--scene $data_dir/${shape_name}.obj \
--load_snapshot $work_dir/$shape_name.msgpack \
--mode sdf \
--n_steps $n_steps \
--save_mesh $work_dir/${shape_name}_${resolution}.ply \
--marching_cubes_res $resolution | tee $work_dir/$shape_name.log

echo rendered "${config_name}_${shape_name}"