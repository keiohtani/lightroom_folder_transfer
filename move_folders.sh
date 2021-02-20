#!/bin/bash

origin_dir=/Volumes/YOUR_OLD_VOLUME
target_dir=/Volumes/YOUR_NEW_VOLUME

IFS=$'\n'

if [ -z "$1" ]; then
    echo "No argument supplied"
    exit 1
fi

if [[ ! $1 =~ ^[1-2][0-9]{3} ]]; then
    echo "Not valid format for year"
    exit 1
fi

year=$1
origin_dir=$origin_dir/$year
target_dir=$target_dir/$year

function move {
    origin_path="$origin_dir/$1/$2" 
    target_path=$target_dir/$1/$2
    if [ -f $target_path ]; then
        echo "  skipped $origin_path"
    else
        mv $origin_path $target_path
        echo "  moved $origin_path to $target_path"
    fi
}


for dir in $(ls -d $origin_dir/*)
    do
    echo started $dir
    for filename in $(ls -p $dir)
        do
        parent_dirname=$( basename $dir )
        target_parent_path=$target_dir/$parent_dirname
        mkdir -p $target_parent_path
        move $parent_dirname $filename
    done
    echo finished $dir
done
