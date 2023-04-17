#!/bin/bash

top_file=Core.v

curr_dir=$(pwd)
dut_dir=$curr_dir/dut
rtl_dir=$dut_dir/rtl
prj_dir=$(dirname $curr_dir)
resources_dir=$prj_dir/src/main/resources
script_dir=$prj_dir/scripts/extract_verilog_module
echo $prj_dir

cd $prj_dir
make rtl mod=Core

rm $script_dir/$top_file
rm -rf $script_dir/output/*
cp $prj_dir/build/$top_file $script_dir
python3 $script_dir/main.py $top_file

rm $rtl_dir/* -rf
cp $script_dir/output/* $rtl_dir
cp $resources_dir/*.v $rtl_dir