
# Installation

## Dependencies

The current version has been integration tested using **Python 3**. We recommend to install the [Anaconda](https://www.anaconda.com/) as the Python environment.

Following Python modules are required for the Seispy, **but do not have to be installed manually.**

- [Numpy](https://numpy.org/)
- [Scipy](https://www.scipy.org/scipylib/index.html)
- [Obspy](https://docs.obspy.org/)
- [Matplotlib](https://matplotlib.org/)
- [Pyqt5](https://pypi.org/project/PyQt5/)

## Install Seispy

Now download and install Seispy.

### Download the source codes

Clone the source code from [Github](https://github.com/xumi1993/seispy.git) to any directory.

```Shell
git clone https://github.com/xumi1993/seispy.git
```

### Install Seispy to the Python environment

Change path to where the source code was cloned into, and install the module via [Python pip](https://pip.pypa.io/) command

```Shell
cd seispy
pip install .
```

## Update Seispy

To update the Seispy, please change to directory of the source code, and execute following commands.

```Shell
cd seispy
git pull
pip install .
```
