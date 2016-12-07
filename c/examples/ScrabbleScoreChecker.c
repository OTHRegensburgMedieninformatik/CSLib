#include <stdio.h>
#include "strlib.h"
#include "simpio.h"

int getLetterScore(char currentChar, char pointChars[], int score) {
	int numChars = stringLength(pointChars);

	int i;
	for(i=0; i<numChars; i++) {
		if (pointChars[i] == currentChar) {
			return score;
		}
	}
	return 0;
}

int getWordScore(char word[]) {
	char onePointChars[] = "AEILNORSTU";
	char twoPointChars[] = "DG";
	char threePointChars[] = "BCMP";
	char fourPointChars[] = "FHVWY";
	char fivePointChars[] = "K";
	char eightPointChars[] = "JX";
	char tenPointChars[] = "QZ";

	int score = 0;

	int wordLength = stringLength(word);

	int i;
	for (i = 0; i < wordLength; i++) {
		char currentChar = word[i];
		score += getLetterScore(currentChar, onePointChars, 1);
		score += getLetterScore(currentChar, twoPointChars, 2);
		score += getLetterScore(currentChar, threePointChars, 3);
		score += getLetterScore(currentChar, fourPointChars, 4);
		score += getLetterScore(currentChar, fivePointChars, 5);
		score += getLetterScore(currentChar, eightPointChars, 8);
		score += getLetterScore(currentChar, tenPointChars, 10);
	}
	return score;
}


int main() {
	char *word;

	printf("Enter word: ");
	word = getLine();
	char *upperCaseWord = toUpperCase(word);

	int scrabbleScore = getWordScore(upperCaseWord);
	printf("Scrabble score for %s: %d\n", word, scrabbleScore);
	return 0;
}