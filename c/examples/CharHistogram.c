
/*
*
* charHistogram.c
*
* This program counts the number of lowercase letters
* in a given sentence and prints them to the screen.
*
* Potential extension:
* - Read sentence from user 
*
*/

#include <stdio.h>
#include "simpio.h"
#include "strlib.h"

#define numCharactersInAlphabet 26

void countCharacters(char sentence[], int histogram[]) {
	int i = 0;
	while (sentence[i] != 0) {
		char currentChar = sentence[i];
		if (currentChar >= 'a' && currentChar <= 'z') {
			int currentCharIndex = currentChar - 'a';
			histogram[currentCharIndex] = histogram[currentCharIndex] + 1;
		}
		i++;
	}
}

void initializehistogram(int histogram[], int numCharacters) {
	int i;
	for (i=0; i < numCharacters; i++) {
		histogram[i] = 0;
	}
}

void printRawResults(int histogram[], int numCharacters) {
	printf("Raw results for your sentence:\n");
	int i;
	for (i=0; i < numCharacters; i++) {
		if (histogram[i] > 0) {
			char character = 'a' + i;
			printf("%c:", character);
			printf("%d\n", histogram[i]);
		}
	}
}


void printHistogramLine(int numStars) {
	int i;
	for (i=0; i<numStars; i++) {
		printf("*");
	}
	printf("\n");
}

void printHistogram(int histogram[], int numCharacters) {
	printf("histogram for your sentence:\n");
	int i;
	for (i=0; i < numCharacters; i++) {
		if (histogram[i] > 0) {
			char character = 'a' + i;
			printf("%c:", character);
			printHistogramLine(histogram[i]);
		}
	}
}

int main() {
	printf("Enter a sentence, I will print a histogram:\n");
	char *sentence = getLine();
	
	int histogram[numCharactersInAlphabet];

	initializehistogram(histogram, numCharactersInAlphabet);
	printf("%s\n", sentence);
	countCharacters(sentence, histogram);
	printRawResults(histogram, numCharactersInAlphabet);
	printHistogram(histogram, numCharactersInAlphabet);

	return 0;
}