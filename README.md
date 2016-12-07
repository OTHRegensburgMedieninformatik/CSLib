# CSLib

CSLib is a fork of Eric Robert's abstraction libraries for C which attempts to simplify the use of C as an introdutory programming language. This library is built on top of ANSI C and provides a basic set of tools and conventions that attempt to facilitate the creation and readability of C programs by abstracting from some of the gory details of C. This library can be pareticularly used in teaching introductory programming to students.

## Building C and Java sources

### MacOS (also tested with Ubuntu and Fedora)
The following commands should also compile the example code in c/examples.

    git clone https://github.com/OTHRegensburgMedieninformatik/CSLib.git
    cd CSLib
    make

### Windows

The Windows version needs MSYS (http://www.mingw.org/wiki/MSYS) in order for make to run. Once MSYS is installed, make sure to edit the PATH variable, so that the MSYS bin folder is the first in the list. This is important, since the Windows find command used in the makefile behaves differently than the MSYS version. Once this is set, the library should compile without errors.
    
    git clone https://github.com/OTHRegensburgMedieninformatik/CSLib.git
    cd CSLib
    make

## TODO

* Bug fixing

