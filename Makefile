# ****************************************************************
# Makefile for SPL

SHELL=/bin/bash

# Sets the target platform for SPL
# Valid values for variable platform are unixlike and windows
ifeq ($(OS),Windows_NT)
PLATFORM=windows
else
PLATFORM=unixlike
endif

# Additional compiler flags
CFLAGS=-std=gnu11
LDLIBS=

ifeq ($(OS),Windows_NT)
LDLIBS += -lshlwapi
endif

BUILD = \
	build \
    build/$(PLATFORM) \
    build/$(PLATFORM)/lib \
    build/$(PLATFORM)/obj

OBJECTS = \
    build/$(PLATFORM)/obj/cslib.o \
    build/$(PLATFORM)/obj/unittest.o \
    build/$(PLATFORM)/obj/exception.o \
    build/$(PLATFORM)/obj/strlib.o \
    build/$(PLATFORM)/obj/random.o \
    build/$(PLATFORM)/obj/simpio.o

LIBRARIES = build/$(PLATFORM)/lib/libcs.a

PROJECT = StarterProject \
		  StarterProjects

# ***************************************************************
# Entry to bring the package up to date
#    The "make all" entry should be the first real entry

all: $(BUILD) $(OBJECTS) $(LIBRARIES) examples


# ***************************************************************
# directories

$(BUILD):
	@echo "Build Directories"
	@mkdir -p $(BUILD)


# ***************************************************************
# Library compilations

build/$(PLATFORM)/obj/cslib.o: c/src/cslib.c c/include/cslib.h c/include/exception.h
	@echo "Build cslib.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/cslib.o -Ic/include c/src/cslib.c

build/$(PLATFORM)/obj/exception.o: c/src/exception.c c/include/cslib.h \
                 c/include/exception.h c/include/strlib.h \
                 c/include/unittest.h
	@echo "Build exception.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/exception.o -Ic/include c/src/exception.c

build/$(PLATFORM)/obj/unittest.o: c/src/unittest.c c/include/cslib.h \
                c/include/exception.h c/include/generic.h c/include/strlib.h \
                c/include/unittest.h
	@echo "Build unittest.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/unittest.o -Ic/include c/src/unittest.c

build/$(PLATFORM)/obj/simpio.o: c/src/simpio.c c/include/cslib.h \
              c/include/generic.h c/include/simpio.h c/include/strlib.h
	@echo "Build simpio.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/simpio.o -Ic/include c/src/simpio.c

build/$(PLATFORM)/obj/strlib.o: c/src/strlib.c c/include/cslib.h \
              c/include/exception.h c/include/generic.h c/include/strlib.h \
              c/include/unittest.h
	@echo "Build strlib.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/strlib.o -Ic/include c/src/strlib.c

build/$(PLATFORM)/obj/random.o: c/src/random.c c/include/cslib.h c/include/exception.h \
              c/include/private/randompatch.h c/include/random.h \
              c/include/unittest.h
	@echo "Build random.o"
	@gcc $(CFLAGS) -c -o build/$(PLATFORM)/obj/random.o -Ic/include c/src/random.c


# ***************************************************************
# Entry to reconstruct the library archive

build/$(PLATFORM)/lib/libcs.a: $(OBJECTS)
	@echo "Build libcs.a"
	@-rm -f build/$(PLATFORM)/lib/libcs.a
	@ar cr build/$(PLATFORM)/lib/libcs.a $(OBJECTS)
	@ranlib build/$(PLATFORM)/lib/libcs.a
	@cp -r c/include build/$(PLATFORM)/

# ***************************************************************
# install

install: build/lib/libcs.a
	@echo "Install"
	rm -rf /usr/local/include/spl
	cp -r build/$(PLATFORM)/include /usr/local/include/spl
	chmod -R a+rX /usr/local/include/spl
	cp build/$(PLATFORM)/lib/{libcs.a} /usr/local/lib/
	chmod -R a+r /usr/local/lib/{libcs.a}
	
examples: build/$(PLATFORM)/lib/libcs.a
	@echo "Build Examples"
	make -C c/examples

starterprojects: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProjects"
	@rm -rf StarterProjects
	@cp -r ide StarterProjects
	@echo "Build StarterProject for Clion on Windows"
	@cp -r build/$(PLATFORM)/lib StarterProjects/clion/windows/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/clion/windows/include
	@echo "Build StarterProject for Clion on Windows"
	@cp -r build/$(PLATFORM)/lib StarterProjects/clion/linux/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/clion/linux/include
	@echo "Build StarterProject for Clion on Windows"
	@cp -r build/$(PLATFORM)/lib StarterProjects/clion/macos/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/clion/macos/include
	@echo "Build StarterProject for CodeBlocks on Windows"
	@cp -r build/$(PLATFORM)/lib StarterProjects/codeblocks/windows/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/codeblocks/windows/include
	@echo "Build StarterProject for CodeBlocks on Linux"
	@cp -r build/$(PLATFORM)/lib StarterProjects/codeblocks/linux/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/codeblocks/linux/include
	@echo "Build StarterProject for CodeBlocks on MacOS"
	@cp -r build/$(PLATFORM)/lib StarterProjects/codeblocks/macos/lib
	@cp -r build/$(PLATFORM)/include StarterProjects/codeblocks/macos/include
	@echo "Check the StarterProjects folder"

clion_windows: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for Clion on Windows"
	@rm -rf StarterProject
	@cp -r ide/clion/windows StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

clion_linux: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for Clion on Linux"
	@rm -rf StarterProject
	@cp -r ide/clion/linux StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

clion_macos: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for Clion on MaxOS"
	@rm -rf StarterProject
	@cp -r ide/clion/macos StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

codeblocks_windows: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for CodeBlocks on Windows"
	@rm -rf StarterProject
	@cp -r ide/codeblocks/windows StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

codeblocks_linux: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for CodeBlocks on Linux"
	@rm -rf StarterProject
	@cp -r ide/codeblocks/linux StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

codeblocks_macos: clean $(BUILD) $(OBJECTS) $(LIBRARIES) 
	@echo "Build StarterProject for CodeBlocks on MacOS"
	@rm -rf StarterProject
	@cp -r ide/codeblocks/macos StarterProject
	@cp -r build/$(PLATFORM)/lib StarterProject/lib
	@cp -r build/$(PLATFORM)/include StarterProject/include
	@echo "Check the StarterProject folder"

# ***************************************************************
# Standard entries to remove files from the directories
#    tidy    -- eliminate unwanted files
#    scratch -- delete derived files in preparation for rebuild

tidy: examples-tidy
	@echo "Clean Project Directory"
	@rm -f `find . -name ',*' -o -name '.,*' -o -name '*~'`
	@rm -f `find . -name '*.tmp' -o -name '*.err'`
	@rm -f `find . -name core -o -name a.out`
	@rm -rf build/classes
	@rm -rf build/obj

examples-tidy:
	@rm -f c/examples/*.o
	@rm -f c/examples/*.exe
	
scratch clean: tidy
	@rm -f -r $(BUILD) $(OBJECTS) $(LIBRARIES) $(PROJECT)
	@echo "Cleaning Done"
