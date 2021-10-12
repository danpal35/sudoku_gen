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
    git clone https://github.com/TechniCollins/sudoku_gen.git


## Create a working dir

### Example:

    python2.7 bin/MakeAppWorkDir.py -c Context -l lib --gitignore /root/sudoku_gen/WebKit


## copy packages and Generate to Working directory

    cp -r /root/sudoku_gen/packages/. /root/sudoku_gen/WebKit/lib/ && cp -r /root/sudoku_gen/Generate /root/sudoku_gen/WebKit/Context/


## Edit /lib/defaults.py

We need to make our DATA_DIR variable point to where we put our lib folder in our working directory.

    (lib/defaults.py line 29): DATA_DIR = os.path.expanduser('/root/sudoku_gen/WebKit/lib/games')


## Add your Generator context to /WebKit/Configs/Application.config
    
    nano Configs/Appconfig.conf

    Contexts['generate'] = 'Context/Generate'


## Edit Configs/AppServer.config to listen to IP
    
    nano Configs/AppServer.config

    Host = 'your_ip'


## Allow Ports

    ufw allow 8086
    ufw allow 8080


## Start the App Server

    /root/sudoku_gen/WebKit/AppServer


## TEST

    http://your_ip:8080



# ORIGINAL CODEBASE

## SOURCE

The source code was downloaded [here](http://www.opensky.ca/~jdhildeb/software/sudokugen/source/sudokugen.tar.gz)

## CHANGES MADE

Many small changes were made to get the app running. However, I forgot to document most of them, but luckily this repository has all the changes I made.

Some of the changes I remember making are;

**sudoku.py line 4**

changed `import Numeric` to `from numpy import oldnumeric as Numeric`

This change was made because the Numeric module nolonger exists indipendently and is now part of the numpy module as oldnumeric.


**sudoku.py line 85**

added `try except ValueError` block


**index.html**

Removed duplicate form.


# TO DO

## Fix Difficulty Level

The difficulty level always remains the same. I suspect one of the following may be cause for this logical bug;

**1:** The code has been written to asses the difficulty of a puzzle after it has been generated. Basically the app tries to solve the generated puzzle itself and determines how difficult it was to arrive at a solution. So even if a user chooses "Easy", but the algorithm determines the puzzle to be "Very hard", that's what will be printed on the PDF. I don't have any experience playing Sudoku, so I can't really tell whether a puzzle is actually difficult or not.


**2:** Maybe all the pre-generated puzzles are really "very difficult". I can't generate any more puzzles to confirm this because the code that is supposed to generate new ones gets stuck in an infinite loop. This is another bug.



## Fix generation of new puzzles

Generation of new puzzles isn't working. `make_unique_puzzles` seems to be stuck in an infinite loop that I couldn't figure out how to fix.
