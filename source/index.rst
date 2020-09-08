.. seispy documentation master file, created by
   sphinx-quickstart on Sat Jul 18 19:55:28 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Seispy Documentation
==================================
Seispy is a Python module for processing seismological data and calculating Receiver Functions. The advanced functions are available to improve the Obspy.

I have been writing Seispy when I was a master student. At first, I wanted to calculate Receiver Functions in Python, but there is no suitable toolkit. Fortunately, The obspy provided mounts of APIs for processing seismic data, so I ported codes for calculating Receiver Functions from Matlab to Python. Today increased functions have been added to Seispy to further process seismic data over than Obspy.

.. image:: https://img.shields.io/travis/com/xumi1993/seispy
   :target: https://travis-ci.com/xumi1993/seispy
.. image:: https://img.shields.io/travis/com/xumi1993/seispy-doc.post?label=doc
   :target: https://seispy.xumijian.me
.. image:: https://img.shields.io/github/license/xumi1993/seispy
.. image:: https://img.shields.io/github/v/tag/xumi1993/seispy
.. image:: https://img.shields.io/github/last-commit/xumi1993/seispy
.. image:: https://img.shields.io/github/commit-activity/m/xumi1993/seispy
.. image:: https://img.shields.io/github/languages/code-size/xumi1993/seispy
.. image:: https://img.shields.io/github/repo-size/xumi1993/seispy
.. image:: https://zenodo.org/badge/41006349.svg
   :target: https://zenodo.org/badge/latestdoi/41006349


.. image:: https://img.shields.io/github/stars/xumi1993/seispy?style=social
   :target: https://github.com/xumi1993/seispy
.. image:: https://img.shields.io/github/forks/xumi1993/seispy?style=social
   :target: https://github.com/xumi1993/seispy

.. image:: _static/seispy_shortcut.png
   :height: 719
   :width: 1182
   :scale: 50
   :align: center

.. toctree::
   :maxdepth: 1
   :caption: Getting Started:

   usage/installation
   usage/calrf
   usage/rf-sta
   usage/pickrf
   usage/ccp

.. toctree::
   :maxdepth: 2
   :caption: API Documentation:

   modules


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
