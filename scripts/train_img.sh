#!/bin/bash

img_name=$1
config_name=$2

# define configs
if [ $config_name == "default" ]; then
    n_steps=31000
else
    echo "Error! Config name not recognized"
    exit 1
fi

work_dir="workspace/${config_name}_${img_name}/"
mkdir -p $work_dir
data_dir="data/image/ours/"

python scripts/run.py \
--scene $data_dir/${img_name}.jpg \
--save_snapshot $work_dir/$img_name.msgpack \
--test_image \
--mode image \
--n_steps $n_steps \
--train | tee $work_dir/$img_name.log

mv out.png $work_dir/${img_name}_pred_${n_steps}.png

echo trained "${config_name}_${img_name}"