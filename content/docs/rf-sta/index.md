---
title: "Calculate PRFs for a station"
date: 2019-09-27T23:09:33+08:00
weight: 30
---

## 1. Perpare seismic records order by stations

Seismic data should be trimed according earthquakes, including direct P arrival. Meanwhile, the data should be order by stations instead of events. For example, YN001 and YN002 are stations the SAC files are data of events recorded by these stations.

```
event_data/
├── YN001
│   ├── 2018.229.15.35.02.1.sac
│   ├── 2018.229.15.35.02.2.sac
│   ├── 2018.229.15.35.02.3.sac
│   ├── 2018.229.22.06.55.1.sac
│   ├── 2018.229.22.06.55.2.sac
│   │......
├── YN002
│   ├── 2018.229.15.35.02.1.sac
│   ├── 2018.229.15.35.02.2.sac
│   ├── 2018.229.15.35.02.3.sac
│   ├── 2018.229.22.06.55.1.sac
│   ├── 2018.229.22.06.55.2.sac
│   │......
```


## 2. Init a project instance

First, let’s init a `rf`instance. In this instance, we can set parameters, match earthquakes from catalog and calculate PRFs.

```Python
from seispy.rf import rf
from os.path import join
from obspy import UTCDateTime

pjt = rf()
```

## 3. Set parameters

Most of parameters are saved in `pjt.para`. Let’s show all default parameters
```Python
print(pjt.para.__dict__)
```
```
{'_datapath': '/Users/xumj',
 '_rfpath': '/Users/xumj',
 '_imagepath': '/Users/xumj',
 '_catalogpath': '/Users/xumj/.pyenv/versions/anaconda3-5.3.1/lib/python3.7/site-packages/seispy-1.1.8-py3.7.egg/seispy/data/EventCMT.dat',
 'offset': None,
 'tolerance': 210,
 'dateformat': '%Y.%j.%H.%M.%S',
 'date_begin': 1976-01-01T00:00:00.000000Z,
 'date_end': 2019-07-11T14:04:15.365860Z,
 'magmin': 5.5,
 'magmax': 10,
 'dismin': 30,
 'dismax': 90,
 'ref_comp': 'BHZ',
 'suffix': 'SAC',
 'noisegate': 5,
 'gauss': 2,
 'target_dt': 0.01,
 'phase': 'P',
 'time_before': 10,
 'time_after': 120,
 'only_r': False}
 ```

Thus, we can set them in our scripts

```
pjt.para.datapath = 'Data/Path/to/station_name'
pjt.para.rfpath = 'Result/Path/to/station_name'
pjt.para.suffix = 'sac'
pjt.para.ref_comp = ".1."
pjt.date_begin = UTCDataTime('20180701')
pjt.date_end = UTCDataTime('20190701')
pjt.para.offset = 0
pjt.para.tolerance = 60
```

or in a configure file
```
[path]
datapath = Data/Path/to/station_name
rfpath = Result/Path/to/station_name
imagepath = Path/to/images
catalogpath =

[para]
date_begin = 20180701
date_end = 20190701

magmin = 5.5
magmax = 10
dismin = 30
dismax = 90
dateformat = %Y.%j.%H.%M.%S
ref_comp = .1.
suffix = sac
tolerance = 60
offset = 0
noisegate = 5
gauss = 0.6
freqmin = 0.05
freqmax = 2
target_dt = 0.01
time_before = 10
time_after = 120
only_r = yes
```

When you want to init the instance using this configure file, please add the path to `rf()`

```Python
pjt = rf(cfg_file='path/to/config')
```

## 4. Search earthquakes from catalog

We use the same process as the [SplitRFLab](https://git.nju.edu.cn/xumi1993/SplitRFLab). To match the data records and events, we should search earthquakes with some criteria (period, epicental distance and maganitude).

### 4.1 Load station infomation

the The station latitude and longitude are absolutely necessary when we are used to search earthquakes. the function will read stla and stlo of SAC header from files in pjt.para.datapath.
```Python
pjt.load_stainfo()
```
### 4.2 Search earthquakes

the function provide two method to search earthquakes. use
```Python
pjt.search_eq()
```
to search earthquakes in IRIS Web service with the CMT catalog.

In addition, the function allow to perpare earthquakes from a CMT catalog file (saved to seispy/seispy/data/EventCMT.dat). Use command updatecatalog to update the catalog file.
```Python
pjt.search_eq(local=True)
```

## 5. Associate SAC files with events

This is a important step, which allow to link SAC files and earthquakes in catalog. The `pjt.para.dateformat`, that is a format string as in [`time.strftime`](https://docs.python.org/3/library/time.html#time.strftime), including datetime infomation will allow to match events in catalog. For example, assuming the filename is `2018.229.15.35.02.1.sac`. the `pjt.para.dateformat` should be `%Y.%j.%H.%M.%S`.

A reference sac file will read to Associate with events. Thus, file-search-string will help to find real SAC files in data path. In this program file-search-string composed of `pjt.para.ref_comp` and `pjt.para.suffix`. The presence of `*pjt.para.ref_comp*pjt.para.suffix`, such as `*.1.*sac` in this example, for SAC files will be found.

the `pjt.para.offset` and `p`jt.para.tolerance` are used to match the origin time from catalog. The definition are the same as those in [SplitRFLab](https://git.nju.edu.cn/xumi1993/SplitRFLab).

>
- The “offset” is the time duration between the event time and the starting time of your seismograms. Ideally, this offset should be identical to the “request start time” defined in the previous window but the data management center may have sent you data beginning later than requested. The offset value represents this difference.
- The “Tolerance” value in seconds will define the time window within which the program will try to associate a seismic file to an event file, by using either its name or the information contained in the header. It is up to the user to find the best compromise: a value too small will let orphans and a value too large will bring confusion since several files could be associated to a seismic event. ![](/images/offset.png)


afert assuming these parameters are right, just use:
```Python
pjt.match_eq()
```

## 6. Pretreatment

The process of pretreatment include retrend, bandpass filter, calculating arrival time, reject bad record with low SNR, trim records and rotate components from NE to RT.

```Python
pjt.detrend()
pjt.filter() # default using 'para.freqmin' and 'para.freqmax'
pjt.cal_phase()
pjt.drop_eq_snr() # The threshold used as 'para.noisegate'
pjt.trim() # from 'para.time_before' before P to 'para.time_after' after P
pjt.rotate()
```


## 7. Calulating PRFs

Set the maximum number of iterations itmax and the minimum misfit minderr to calculate PRFs using iterative time-domain deconvolution method.

```Python
pjt.deconv(itmax=400, minderr=0.001)
``` 


## 8. Save PRFs

Save the PRFs to pjt.para.rfpath with some criteria. Two kind of criteria allow to set (i.e., crust or mtz). if the parameter set as None, all of PRFs will be saved.

### `crust`
- The max peak should appare berween -2s and 2s


### `mtz`

- The max peak should appare berween -5s and 5s

- the maximum amplitudes of PRFs in a 30–120 s window after the direct P are smaller than 30% of the maximum amplitudes of the direct P phases.



```Python
pjt.saverf(criterion='crust')
```