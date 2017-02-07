# Makefile for CSLib examples
#****************************************************************

ifeq ($(OS),Windows_NT)
PLATFORM=windows
FLAGS = -L../../build/$(PLATFORM)/lib -lcs -lm 
FLAGS += -lshlwapi
CSTD =
else
PLATFORM=unixlike
FLAGS = -L../../build/$(PLATFORM)/lib -lcs -lm 
CSTD = -std=c99
endif


PROGRAMS = \
    NumberDelimiter \
    ScrabbleScoreChecker \
    CharHistogram

# ***************************************************************
# Entry to bring the package up to date
#    The "make all" entry should be the first real entry

all: $(PROGRAMS)

NumberDelimiter: NumberDelimiter.o
	gcc -o NumberDelimiter NumberDelimiter.o $(FLAGS)

NumberDelimiter.o: NumberDelimiter.c
	gcc -c -I../include NumberDelimiter.c

ScrabbleScoreChecker: ScrabbleScoreChecker.o
	gcc -o ScrabbleScoreChecker ScrabbleScoreChecker.o $(FLAGS)

ScrabbleScoreChecker.o: ScrabbleScoreChecker.c
	gcc -c -I../include ScrabbleScoreChecker.c

CharHistogram: CharHistogram.o
	gcc -o CharHistogram CharHistogram.o $(FLAGS)

CharHistogram.o: CharHistogram.c
	gcc -c -I../include CharHistogram.c

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
