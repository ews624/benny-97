#!/bin/bash

cd /home/benny/Documents/Games/Worm
echo $PWD

# Cleanup old dingleberries
rm *.o *.mod *.dat worm

# Compile
make

# Cleanup optional
# rm *.o *.mod


