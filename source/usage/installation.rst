Installation
=================

Dependencies
---------------

The current version has been integration tested using **Python 3**. We recommend to install the `Anaconda <https://www.anaconda.com/>`_ as the Python environment.

Following Python modules are required for the Seispy, **but do not have to be installed manually.**

- `Numpy <https://numpy.org/>`_
- `Scipy <https://www.scipy.org/scipylib/index.html>`_
- `Obspy <https://docs.obspy.org/>`_
- `Matplotlib <https://matplotlib.org/>`_
- `Pyqt5 <https://pypi.org/project/PyQt5/>`_

Install and update via `PyPi <https://pypi.org/>`_
---------------------------------------------------

Run in command line:
^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: shell

    pip install python-seispy

.. note::

    1. We recommend Chinese users to use `清华大学 pypi 镜像 <https://mirrors.tuna.tsinghua.edu.cn/help/pypi/>`_ to install Seispy.
    
    2. An error may be raised during installing Obspy via PyPi on Linux platform as following:

        .. code-block::

            ERROR: Could not build wheels for obspy which use PEP 517 and cannot be installed directly

        Please `install Obspy via conda <https://github.com/obspy/obspy/wiki/Installation-via-Anaconda>`_ first.

        .. code-block:: shell

            conda config --add channels conda-forge
            conda install obspy

Upgrade to stable version
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: shell

    pip install python-seispy -U


Install and update from source code
--------------------------------------

Download the source codes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Clone the source code from `Github <https://github.com/xumi1993/seispy.git>`_ to any directory.

.. code-block:: shell

    git clone --depth=1 https://github.com/xumi1993/seispy.git


For **Chinese users**, try to clone the source code from `Git service of Nanjing University <https://git.nju.edu.cn/geophy/seispy>`_

.. code-block:: shell

    git clone https://git.nju.edu.cn/geophy/seispy.git


Install Seispy to the Python environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Change path to where the source code was cloned into, and install the module via `Python pip <https://pip.pypa.io/>`_ command

.. code-block:: shell

    cd seispy
    pip install .

Update Seispy
^^^^^^^^^^^^^^^^

To update the Seispy, please change to directory of the source code, and execute following commands.

.. code-block:: shell

    cd seispy
    git pull
    pip install .
