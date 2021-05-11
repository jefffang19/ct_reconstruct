# ct_reconstruct

homework for Medical Imaging Systems (Spring 2021)

## How to run

### calls radon and iradon functions to perform projection and filtered back projection
```
part_one.m
```

### DO NOT calls radon and iradon functions to perform projection and filtered back projection, implement it myself
```
% do Ram-Lak filter in fourier domain
part_two_freq.m

% do Ram-Lak filter in spatial domain
part_two_spatial.m
```

## files explan
```
% read image
read_img.m

% ped image in order to rotate
ped_img.m

% performs forward projection
get_proj.m

% performs filtering in frequency domain
ramp_filter_freq.m

% performs filtering in spatial domain
ramp_filter_spatial.m

% performs back projection
back_proj.m
```
