#!/bin/bash

# there is a total of 22 scenes

#############
# TRAINING
#############

# set the number of training examples
n_train=11

mkdir train/
cd train

for ((i=0; i<n_train; i++)); do

    if [ $i -lt 10 ]
    then 
        curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s0'$i'.zip'
    else
        curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s'$i'.zip'
    fi
done

#############
# VALIDATION
#############

# set the number of validation examples
n_val=2

cd ..
mkdir train/
cd train

for ((j=$i; j<n_val+; i++)); do

    if [ $j -lt 10 ]
    then 
        curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s0'$i'.zip'
    else
        curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s'$i'.zip'
    fi
done






