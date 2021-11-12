#!/bin/bash

# there is a total of 22 scenes
# http://asrl.utias.utoronto.ca/datasets/devon-island-rover-navigation/rover-traverse.html#Downloads

download_scene () {
    
    # $1 : kind of dataset
    # $2 : start scene
    # $3 : end scene (included)

    for ((i=$2; i<=$3; i++)); do

        if [ $i -lt 10 ]
        then 
            scene_idx='0'$i
        else
            scene_idx=$i
        fi

        
        # download the scene
        curl -o './train/scene_'$scene_idx'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/'$1'/'$1'-s'$scene_idx'.zip'
        # unzip it
        unzip $dataset_version'-s'$scene_idx'.zip' -d 'train/s'$scene_idx'/'
        # remove the zip file
        rm -rf $dataset_version'-s'$scene_idx'.zip'

        echo "Downloaded scene-"$scene_idx

    done
}

# color-raw-1280x960, grey-rectified-512x384, color-rectified-1280x960
dataset_version="color-raw-1280x960"

n_train=11
n_val=2
n_test=2

# create folders, if they do not exists
mkdir train/
mkdir val/
mkdir test/

# TRAINING
echo "-- Downloading train images..."
download_scene $dataset_version 0 $n_train 

# VALIDATION
echo "-- Downloading train images..."
download_scene $dataset_version $n_train+1 $n_train+$n_val

# TEST
echo "-- Downloading test images..."
download_scene $dataset_version $n_train+$n_val+1 $n_train+$n_val+$n_test

# DOWNLOAD LABELS

# download the labels in the current folder
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/image-times.txt > image-times.txt
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/gps-topocentric.txt > gps-topocentric.txt
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/inclinometer-sampled.txt > inclinometer-sampled.txt

