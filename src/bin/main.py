#!/usr/bin/python3

import sys

if __name__ == '__main__':
    input_file = sys.argv[1] if len(sys.argv) >= 2 else "/dev/stdin"
    output_file = sys.argv[2] if len(sys.argv) >= 3 else "/dev/stdout"
    with open(input_file, 'r') as f:
        lines = f.readlines()
    with open(output_file, 'w') as f:
        for line in sorted(lines):
            f.write(line)
