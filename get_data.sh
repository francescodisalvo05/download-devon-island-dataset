#!/bin/bash

# there is a total of 22 scenes
# http://asrl.utias.utoronto.ca/datasets/devon-island-rover-navigation/rover-traverse.html#Downloads

# to do : 
# -- define a custom function in order to define the for loop just once

# color-raw-1280x960, grey-rectified-512x384, color-rectified-1280x960
dataset_version = "color-raw-1280x960"

#############
# TRAINING
#############

echo "-- Downloading train images..."

# set the number of training examples
n_train=11

mkdir train/

for ((i=0; i<n_train; i++)); do

    if [ $i -lt 10 ]
    then 
        scene_idx='0'$i
    else
        scene_idx=$i
    fi

    # log
    echo scene_$scene_idx
    # download the scene
    curl -o './train/scene_'$scene_idx'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/'$dataset_version'/'$dataset_version'-s'$scene_idx'.zip'
    # unzip it
    unzip $dataset_version'-s'$scene_idx'.zip' -d 'train/s'$scene_idx'/'
    # remove the zip file
    rm -rf $dataset_version'-s'$scene_idx'.zip'

done


#############
# VALIDATION
#############

echo "-- Downloading validation scenes..."

# set the number of validation examples
n_val=2

mkdir val/

for ((j=$i; j<n_train+n_val; j++)); do

    if [ $j -lt 10 ]
    then 
        scene_idx='0'$j
    else
        scene_idx=$j
    fi

    # log
    echo scene_$scene_idx
    # download the scene
    curl -o './train/scene_'$scene_idx'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/'$dataset_version'/'$dataset_version'-s'$scene_idx'.zip'
    # unzip it
    unzip $dataset_version'-s'$scene_idx'.zip' -d 'train/s'$scene_idx'/'
    # remove the zip file
    rm -rf $dataset_version'-s'$scene_idx'.zip'

done


#############
# TESTING
#############

echo "-- Downloading test scenes..."

# set the number of testing examples
n_test=2

mkdir test/

for ((k=$j; k<n_train+n_val+n_test; k++)); do

    if [ $k -lt 10 ]
    then 
        scene_idx='0'$k
    else
        scene_idx=$k
    fi

    # log
    echo scene_$scene_idx
    # download the scene
    curl -o './train/scene_'$scene_idx'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/'$dataset_version'/'$dataset_version'-s'$scene_idx'.zip'
    # unzip it
    unzip $dataset_version'-s'$scene_idx'.zip' -d 'train/s'$scene_idx'/'
    # remove the zip file
    rm -rf $dataset_version'-s'$scene_idx'.zip'

done


#################
# DOWNLOAD LABELS
#################

# download the labels in the current folder
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/image-times.txt > image-times.txt
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/gps-topocentric.txt > gps-topocentric.txt
curl -N ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/logs/inclinometer-sampled.txt > inclinometer-sampled.txt

