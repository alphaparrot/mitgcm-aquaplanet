#!/bin/bash

module load intel/intel-18
module load openmpi/3.0.0-intel-18
load_netcdf_intel

mkdir build_locked
cd build_locked
make Clean
../../../tools/genmake2 -mpi -fortran mpifort -cc mpicc -mods ../code_locked -of ../../../tools/build_options/linux_amd64_ifort_sunnyvale
make depend
make

cd ../
mkdir $1
cd $1
cp ../input/* .
cp ../input.thSI/* .
cp ../input.locked/* .
cp ../glue* .
cp ../runmit .
cp ../build_locked/mitgcmuv .
cd ../
