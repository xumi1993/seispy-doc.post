# 3-D CCP stacking for mantle transition zone structure under the Tibet.

The discontinuities of the 410 and the 660 (D410 and D660) are velocity discontinuities at the bottom of the upper mantle. The receiver function method will provide visible phases to highlight the topography of D410 and D660. The difference in depth between the D410 and D660 (i.e., the mantle transition zone (MTZ) thickness) is correspond to mineral phase transitions and thermal process in the mantle. Here, we will introduce the usage of the Seispy for imaging the MTZ structure.

## Download link


The package include:

- `RFdepth_1D.npy`: RF data with 1-D time-to-depth conversion using `rf2depth` command.
- `ccp.cfg`: Configure file for 3-D CCP stacking. Note that following options are exclusive.
  - `peakfile`: File to the output depth of the D410 and D660.
  - `[spacedbins]`: options for spaced grid of bins.
- `ps_mtz.sh`: plot map for topography of D410 and D660 and the MTZ thickness.
- `ps_profile`: plot section with 2-D CCP stacking along a profile.