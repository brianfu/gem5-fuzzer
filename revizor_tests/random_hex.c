#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {
  int i;

  // Seed the random number generator with the current time
  srand(time(NULL));

  // Generate and print 1536 random hexadecimals
  for (i = 0; i < 1536; i++) {
    printf("%016lx", ((unsigned long)rand() << 32) | (unsigned long)rand());

    if (i < 1535) {
      printf(",");
    }
  }

  return 0;
}

// gcc -o random_hex random_hex.c
// ./random_hex > input.csv