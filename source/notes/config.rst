Templates of Configurations
=================================

RF calculation
---------------

.. code-block:: python

    [path]
    # Data path with event records
    datapath = Data.CB.NJ2

    # Output RF path
    rfpath = ./RFresult/CB.NJ2

    # Catalog path
    catalogpath = events_all.dat

    [search_eq]
    # Date range
    date_begin = 20140101
    date_end = 20150723

    # Catalog server, defaults to IRIS
    catalog_server = IRIS

    # Events limitation
    magmin = 5.5
    magmax = 10
    dismin = 30
    dismax = 90

    [match_eq]
    # Date format in SAC filenames
    dateformat = %Y.%j.%H%M%S

    # Reference component in SAC filenames
    ref_comp = .BHZ.

    # Suffix of SAC filenames
    suffix = SAC

    # Relative time and tolerance
    offset = 0
    tolerance = 10

    [snr]
    # Threshold of SNR
    noisegate = 1

    # Time length of SNR calculation
    noiselen = 50

    [filter]
    # Low and high cut off frequency
    freqmin = 0.05
    freqmax = 2

    [rotation]
    # Target components, TRZ or LQT available
    comp = TRZ

    [trim]
    # Time before and after P arrival for trim
    time_before = 10
    time_after = 120

    [decon]
    # Deconvolution method, iter or water available
    decon_method = iter

    # Gauss factor
    gauss = 2

    # Iteration times and min error
    itmax = 400
    minderr = 0.001

    # Water level
    wlevel = 0.05

    [save]
    # DT for resample
    target_dt = 0.01

    # Calculate only R component, yes or no available
    only_r = no
    
    # Criterion for saving RFs, non-set, crust or mtz available
    criterion = crust

    # Max RMS for RFs
    rmsgate = 0.25

Hk stacking
-------------

.. code-block:: python

    [FileIO]
    # Path to RFs
    rfpath = ./RFresult/CB.NJ2
    
    # Output path to images
    hkpath = ./

    # Path to result file
    hklst =

    [hk]
    # Range of H and k
    hmin = 20
    hmax = 50
    kmin = 1.6
    kmax = 1.9

    # Crustal Vp
    vp = 6.3

    # Weight for stacking
    weight1 = 0.7
    weight2 = 0.2
    weight3 = 0.1

CCP stacking
---------------
.. code-block:: python

    [FileIO]
        # Path to stations with RF sac files
    rfpath = /path/to/RFresult

    # Path to station list
    stalist = /path/to/sta_all.lst

    # Path to the lib of Ps ray parameters. 
    # If it's empty the ray parameters of Ps would be assumed as that of P arrival
    rayp_lib =

    # Output data structure after time to depth
    depthdat =  /path/to/RFdepth

    # Output data structure after CCP stacking
    stackfile = /path/to/stack_data

    # Station list used to stack
    stack_sta_list = /path/to/stack_sta.lst

    # Path to 1D velocity model with 3 columns: depth vp vs
    # If it's empty, the IASP91 model will be used in time-to-depth conversion 
    velmod =

    # Optional, Path to file for searching depth of d410 and d660
    peakfile = 

    [bin]
    # For linear array, wether create bins with a self-adaptive method
    adaptive = false

    # The shape of bins, circle or rect available 
    shape = rect

    # Radius of bins in km
    # Set to empty for determination of radius with fresnel zone
    bin_radius =

    # period of S wave (for assuming the radius of fresnel zone)
    domperiod = 5

    # Width of the profile in km, only works for rectangle bin
    width = 100

    # sliding or spacing interval of bins in km 
    slide_val = 5

    [line]
    # Coordinate of two end points for ccp_profile
    profile_lat1 = 27.5
    profile_lon1 = 94
    profile_lat2 = 36.5
    profile_lon2 = 92

    [spacedbins]
    # Spaced grid for ccp3d
    center_lat = 32
    center_lon = 94
    half_len_lat = 4
    half_len_lon = 4

    [depth]
    # Max depth for time-to-depth conversion
    dep_end = 800
    dep_val = 1

    [stack]
    # Stack RFs from <stack_start> km to <stack_end> km with interval of <stack_val> km
    stack_start = 300
    stack_end = 750
    stack_val = 2

    # Samples in bootstrap method
    boot_samples = 2000
