# ****************************************************************
# Makefile for Makefile StartProject

SHELL=/bin/bash

# Sets the target platform for SPL
# Valid values for variable platform are unixlike and windows
ifeq ($(OS),Windows_NT)
PLATFORM=windows
else
PLATFORM=unixlike
endif

# Additional compiler flags
CFLAGS=-std=gnu11 -g -Wall
LDLIBS = lib/libcs.a 

BUILD = \
	build \
    build/$(PLATFORM) \
    build/$(PLATFORM)/obj

OBJECTS = \
    build/$(PLATFORM)/obj/HelloConsole.o

PROGRAMMS = \
	build/$(PLATFORM)/HelloConsole


# ***************************************************************
# Entry to bring the package up to date
#    The "make all" entry should be the first real entry

all: $(BUILD) $(OBJECTS) $(PROGRAMMS) 

# ***************************************************************
# Directories

$(BUILD):
	@echo "Build Directories"
	@mkdir -p $(BUILD)

# ***************************************************************
# Programm


build/$(PLATFORM)/HelloConsole:
	@echo "Build HelloConsole"
	@gcc -o build/$(PLATFORM)/HelloConsole build/$(PLATFORM)/obj/HelloConsole.o $(LDLIBS)

build/$(PLATFORM)/obj/HelloConsole.o: HelloConsole.c
	@echo "Build HelloConsole.o"
	@gcc $(CFLAGS) -Iinclude -c -o build/$(PLATFORM)/obj/HelloConsole.o HelloConsole.c



# ***************************************************************
# Standard entries to remove files from the directories
#    tidy    -- eliminate unwanted files
#    scratch -- delete derived files in preparation for rebuild

tidy:
	@echo "Clean Project Directory"
	@rm -f `find . -name ',*' -o -name '.,*' -o -name '*~'`
	@rm -f `find . -name '*.tmp' -o -name '*.err'`
	@rm -f `find . -name core -o -name a.out`
	@rm -rf build/obj
	
scratch clean: tidy
	@rm -f -r $(BUILD) $(OBJECTS) $(LIBRARIES) $(PROJECT)
	@echo "Cleaning Done"
