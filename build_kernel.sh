#!/bin/bash

make clean mrproper

make ARCH=arm charge_defconfig
make -j8 ARCH=arm HOSTCFLAGS="-g -O3"

cp arch/arm/boot/zImage ../../../device/samsung/charge/kernel

for M in `find . -name *.ko`
do
  cp "$M" ../../../device/samsung/charge/modules
done


