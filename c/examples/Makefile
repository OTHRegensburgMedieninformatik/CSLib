# Makefile for spl
#****************************************************************

PROGRAMS = \
    NumberDelimiter

FLAGS = -L../../build/lib -lcs -lm

ifeq ($(OS),Windows_NT)
FLAGS += -lshlwapi
endif

# ***************************************************************
# Entry to bring the package up to date
#    The "make all" entry should be the first real entry

all: $(PROGRAMS)

NumberDelimiter: NumberDelimiter.o
	gcc -o NumberDelimiter NumberDelimiter.o $(FLAGS)

NumberDelimiter.o: NumberDelimiter.c
	gcc -c -I../include NumberDelimiter.c

# ***************************************************************
# Standard entries to remove files from the directories
#    tidy  -- eliminate unwanted files
#    clean -- delete derived files in preparation for rebuild

tidy:
	@rm -f `find . -name ',*' -o -name '.,*' -o -name '*~'`
	@rm -f `find . -name '*.tmp' -o -name '*.err'`
	@rm -f `find . -name core -o -name a.out`

clean scratch: tidy
	@rm -f *.o *.a $(PROGRAMS)
