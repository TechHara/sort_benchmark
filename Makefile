CC = clang
CXX = clang++
CFLAGS = -O3 -g
CXXFLAGS = -O3 -g -std=c++17
all:
	$(CC) $(CFLAGS) src/bin/main.c -o target/release/c
	$(CXX) $(CXXFLAGS) src/bin/main.cc -o target/release/cc
	ln -sf `realpath src/bin/main.py` target/release/py1
