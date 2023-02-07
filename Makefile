CC = clang++
FLAGS = -O3 -g -std=c++17
all:
	$(CC) $(FLAGS) src/bin/cpp1.cc -o target/release/cpp1
	$(CC) $(FLAGS) src/bin/cpp2.cc -o target/release/cpp2
	$(CC) $(FLAGS) src/bin/c1.cc -o target/release/c1