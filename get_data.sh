#!/bin/bash

# there is a total of 22 scenes

# to do : parametrize the kind of images that we want
# -- they can be : 

#############
# TRAINING
#############

echo "-- Downloading train images..."

# set the number of training examples
n_train=11

mkdir train/
cd train

for ((i=0; i<n_train; i++)); do

    if [ $i -lt 10 ]
    then 
        echo 'scene_0'$i'.zip'
        #curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s0'$i'.zip'
    else
        echo 'scene_'$i'.zip'
        #curl -o './train/scene_0'$i'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s'$i'.zip'
    fi
done

#############
# VALIDATION
#############

echo "-- Downloading validation scenes..."

# set the number of validation examples
n_val=2

cd ..
mkdir val/
cd val

for ((j=$i; j<n_train+n_val; j++)); do

    if [ $j -lt 10 ]
    then 
        echo 'scene_0'$j'.zip'
        curl -o './val/scene_0'$j'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s0'$j'.zip'
    else
        echo 'scene_'$j'.zip'
        curl -o './val/scene_0'$j'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s'$j'.zip'
    fi
done


#############
# TESTING
#############

echo "-- Downloading test scenes..."

# set the number of testing examples
n_test=2

cd ..
mkdir test/
cd test

for ((k=$j; k<n_train+n_val+n_test; k++)); do

    if [ $k -lt 10 ]
    then 
        echo 'scene_0'$k'.zip'
        curl -o './train/scene_0'$k'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s0'$k'.zip'
    else
        echo 'scene_'$k'.zip'
        curl -o './train/scene_0'$k'.zip' 'ftp://asrl3.utias.utoronto.ca/Devon-Island-Rover-Navigation/rover-traverse/grey-rectified-512x384/grey-rectified-512x384-s'$k'.zip'
    fi
done




