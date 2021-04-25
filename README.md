# RExplorer

This simple full stack app is a basic windows file explorer that enables tabbed browsing and file opening. A local server is run using either R or Python to serve the browser based gui.

## Using R

In the root directory, call `Rscript serve.R` to run the local server and then open `http://127.0.0.1/8000/` to use the gui to explorer the file directory and open files.

Note that the `plumber` library is required.

## Using Python

In the root directory, call `python serve.py` to run the local server and then open `http://127.0.0.1/8000/` to use the gui to explorer the file directory and open files.

Note that the `flask` package is required.

## Warning!

The local server is running statements in the command line which is very insecure outside of local usage. 