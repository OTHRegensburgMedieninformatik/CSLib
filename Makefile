# ****************************************************************
# Makefile for SPL

SHELL=/bin/bash

# Additional compiler flags
CFLAGS=-std=gnu11
LDLIBS=

ifeq ($(OS),Windows_NT)
LDLIBS += -lshlwapi
endif

BUILD = \
    build \
    build/lib \
    build/obj

OBJECTS = \
    build/obj/cslib.o \
    build/obj/unittest.o \
    build/obj/exception.o \
    build/obj/strlib.o \
    build/obj/random.o \
    build/obj/simpio.o

LIBRARIES = build/lib/libcs.a

# ***************************************************************
# Entry to bring the package up to date
#    The "make all" entry should be the first real entry

all: $(BUILD) $(OBJECTS) $(LIBRARIES)


# ***************************************************************
# directories

$(BUILD):
	mkdir -p $(BUILD)


# ***************************************************************
# Library compilations

build/obj/cslib.o: c/src/cslib.c c/include/cslib.h c/include/exception.h
	gcc $(CFLAGS) -c -o build/obj/cslib.o -Ic/include c/src/cslib.c

build/obj/exception.o: c/src/exception.c c/include/cslib.h \
                 c/include/exception.h c/include/strlib.h \
                 c/include/unittest.h
	gcc $(CFLAGS) -c -o build/obj/exception.o -Ic/include c/src/exception.c

build/obj/unittest.o: c/src/unittest.c c/include/cslib.h \
                c/include/exception.h c/include/generic.h c/include/strlib.h \
                c/include/unittest.h
	gcc $(CFLAGS) -c -o build/obj/unittest.o -Ic/include c/src/unittest.c

build/obj/simpio.o: c/src/simpio.c c/include/cslib.h \
              c/include/generic.h c/include/simpio.h c/include/strlib.h
	gcc $(CFLAGS) -c -o build/obj/simpio.o -Ic/include c/src/simpio.c

build/obj/strlib.o: c/src/strlib.c c/include/cslib.h \
              c/include/exception.h c/include/generic.h c/include/strlib.h \
              c/include/unittest.h
	gcc $(CFLAGS) -c -o build/obj/strlib.o -Ic/include c/src/strlib.c

build/obj/random.o: c/src/random.c c/include/cslib.h c/include/exception.h \
              c/include/private/randompatch.h c/include/random.h \
              c/include/unittest.h
	gcc $(CFLAGS) -c -o build/obj/random.o -Ic/include c/src/random.c


# ***************************************************************
# Entry to reconstruct the library archive

build/lib/libcs.a: $(OBJECTS)
	-rm -f build/lib/libcs.a
	ar cr build/lib/libcs.a $(OBJECTS)
	ranlib build/lib/libcs.a
	cp -r c/include build/

# ***************************************************************
# install

install: build/lib/libcs.a
	rm -rf /usr/local/include/spl
	cp -r build/include /usr/local/include/spl
	chmod -R a+rX /usr/local/include/spl
	cp build/lib/{libcs.a} /usr/local/lib/
	chmod -R a+r /usr/local/lib/{libcs.a}
	
#examples: build/lib/libcs.a	
	#make -C c/examples

# ***************************************************************
# Standard entries to remove files from the directories
#    tidy    -- eliminate unwanted files
#    scratch -- delete derived files in preparation for rebuild

tidy: examples-tidy
	@rm -f `find . -name ',*' -o -name '.,*' -o -name '*~'`
	@rm -f `find . -name '*.tmp' -o -name '*.err'`
	@rm -f `find . -name core -o -name a.out`
	@rm -rf build/classes
	@rm -rf build/obj

examples-tidy:
	@rm -f c/examples/*.o
	@rm -f c/examples/*.exe
	
scratch clean: tidy
	@rm -f -r $(BUILD) $(OBJECTS) $(LIBRARIES)
