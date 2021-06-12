# Calulating PRFs of the station CB.NJ2

Here, we provide an example for calculating PRFs of CB.NJ2, which is a permanent station at Nanjing China mainland.

## Download Seismic data and config file

Download link: [](https://osf.io/c8h3t/download)

unzip the file to any directory.
```
tar -xzf Data.CB.NJ2.tar.gz
```

the package include the seismic records of the station CB.NJ2, the config file for calculating PRFs and H-k stacking.

The seismic records of CB.NJ2 were cut out from origin time of seismic events to 1000 s after the origin time, which contained the direct P wave and its conversion phases.

## Run this example

Change directory to Data.CB.NJ2 then execute following command:

```
prf rf.cfg
```

As the `rfpath` set in the `rf.cfg`, run following command to virtual check PRFs use a GUI. See [Virtual check PRFs with an user interface](../usage/pickrf.md)

```
pickrf ./RFresult/CB.NJ2
```

# Estimated the Moho depth and the crustal Vp/Vs using the H-k stacking method

The PRFs were saved to `./RFresult/CB.NJ2`. The `CB.NJ2finallist.dat` was created via the virtual check. The Moho depth can be estimated using the the H-k stacking method.

The Seispy has provided a command `hk` to do this process.

```
usage: hk [-h] [-p] [-v] cfg_file

HK stacking for single station

positional arguments:
  cfg_file    Path to HK configure file

optional arguments:
  -h, --help  show this help message and exit
  -p          Whether to save the image
  -v          Display results to standard output
```

## Prepare a configure file for `hk`

Here we provide an `hk.cfg` in this example. In this file, please specify input/output directories and some other parameters before doing H-k stacking as following

```
hk hk.cfg -p
```

The figure shows the stacking of difference phases and the final result of the estimation.
![](../_static/CB.NJ2.png)

The result of the Moho depth and Vp/Vs were saved into the `hk.dat`.