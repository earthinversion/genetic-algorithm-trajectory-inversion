# genetic-algorithm-trajectory-inversion
MATLAB codes to invert for the trajectory of meteor. The trajecotry is constrained based on the parameters: vel (in m/s), x0, y0, gamma, delta, t0.
```vel -> speed```
```gamma -> azimuth```
```delta -> elevation angle```
```(x0,y0) -> the termination point```
```t0 -> the expected time at the termination point```

## Two Assumptions:
1. the meteor penetrates linearly through the atmosphere with a constant velocity
2. the shockwave speed of 320 m/s is uniform in the atmosphere

## Run
run the main matlab script:
```ga_test.m```
    - change the number of run `numrun` to considerably high value (e.g. 20) to estimate reliable output.
    - change the lower and upper limits of the trajectory parameters.
    - change the observed arrival times of the shockwaves, `dobs` in the script `fit_arrival_times.m`
    - the coordinates of the stations are obtained directly from the sac headers of the seismograms. script: `get_stations_coords.m`





## For details:
Kumar, U., Chao, B.F., Hsieh, Y. et al. A meteor shockwave event recorded at seismic and infrasound stations in northern Taiwan. Geosci. Lett. 4, 13 (2017). https://doi.org/10.1186/s40562-017-0079-2