#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int compare_lines(const void *a, const void *b) {
  return strcmp(*(char **)a, *(char **)b);
}

int main(int argc, const char** argv) {
  char const* input = argc >= 2 ? argv[1] : "/dev/stdin";
  char const* output = argc >= 3 ? argv[2] : "/dev/stdout";
  FILE* ifs = fopen(input, "r");
  if (!ifs) return 1;
  FILE* ofs = fopen(output, "w");
  if (!ofs) return 1;

  size_t capa = 1;
  char **lines = malloc(capa * sizeof(char*));
  size_t num_lines = 0;

  while (1) {
    char* buffer = NULL;
    size_t buffer_size;
    size_t len = getline(&buffer, &buffer_size, ifs);
    if (len == -1) break;
    // push to lines
    if (num_lines == capa) {
      capa *= 2;
      void* new_lines = realloc(lines, capa * sizeof(char*));
      if (!new_lines) return 1;
      lines = new_lines;
    }
    lines[num_lines++] = buffer;
  }

  qsort(lines, num_lines, sizeof(char *), compare_lines);

  for (int i = 0; i < num_lines; i++) {
    char* line = lines[i];
    fwrite(line, sizeof(char), strlen(line), ofs);
    free(line);
  }

  free(lines);
  fclose(ifs);
  fclose(ofs);

  return 0;
}
