# INSTALLATION GUIDE

## Python 2.7

The app requires python 2.4. However, installing packages for that version of python is ridiculously difficult, so we'll install 2.7.
    
    sudo apt-get install python2.7

## Virtual Environment

    virtualenv -p python2.7 env

    source env/bin/activate


## WebKit

    cd /usr/local/lib/python2.7/site-packages

	wget https://files.pythonhosted.org/packages/4c/1b/6ba0653b5a348f4f9c72f57e253c57cf3d8e08c6313fd872853b4aa1b45c/Webware-for-Python-1.1.3.tar.gz#sha256=5437b2e5c1f98b82a30a05e8254f0bcdf98042fdcbf4d87bae4f573f986b40d6

    tar xzvf Webware-for-Python-1.1.3.tar.gz

    rm Webware-for-Python-1.1.3.tar.gz

    cd Webware-1.1.3

    python2.7 install.py

    Set Password: webkit_pWd

## INSTALL DEPENDENCIES

    pip install numpy==1.8.0


## Get project files
    git clone 


## Create a working dir

### Example:

    python2.7 bin/MakeAppWorkDir.py -c Context -l lib --gitignore /root/sudoku_gen/WebKit


## copy packages and Generator to Working directory

    cp -r /root/sudoku_gen/packages /root/sudoku_gen/WebKit/lib && cp -r /root/sudoku_gen/Generator /root/sudoku_gen/WebKit/Context/


## Edit /lib/defaults.py

We need to make our DATA_DIR variable point to where we put our lib folder in our working directory.

    (lib/defaults.py line 29): DATA_DIR = os.path.expanduser('/root/sudoku_gen/WebKit/lib/games')


## Start the App Server

    /home/technicollins/Desktop/Projects/sudoku_gen/WebKit/AppServer


## TEST

    Browse http://localhost:8080
