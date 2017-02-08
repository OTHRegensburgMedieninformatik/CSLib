# CSLib

CSLib is a fork of Eric Robert's abstraction libraries for C which attempts to simplify the use of C as an introdutory programming language. This library is built on top of ANSI C and provides a basic set of tools and conventions that attempt to facilitate the creation and readability of C programs by abstracting from some of the gory details of C. This library can be pareticularly used in teaching introductory programming to students.

## Building C and Java sources
The Makefile automatically detects your system and switches between the Windows and Linux version (no configuration required).

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

## Compiling and running the C example programs
The library comes with several example programs that demonstrate the capability of the library but can also be used as student assignments. The examples are automatically compiled together with the library by running make from the top level directory of the code.

Examples can be compiled seperately from c/examples.
From there run make to compile.

## Create StartProject
The library comes with a StartProject for Clion that have all needed files included.

The StartProject can be created with one of the following commands

    IDE = [ "clion", "codeblocks"]
    PLATFORM = ["windows","linux","macos"]

    make IDE_PLATFORM

>make clion_linux


And is located in Spl-for-C/StartProject

Additional you can also build all StarterProjects with

    make starterprojects

## TODO

* Bug fixing

