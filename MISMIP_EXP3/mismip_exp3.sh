#!/bin/sh

$(

start=$PWD/MatlabWrapper.m;

/usr/local/MATLAB/R2022b/bin/matlab -nodisplay -r "run $start; quit;" 1>>mismip_exp3_std.out 2>>mismip_exp3_err.out;

)&
