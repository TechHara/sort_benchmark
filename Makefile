CC = clang
CXX = clang++
CFLAGS = -O3 -g
CXXFLAGS = -O3 -g -std=c++17
all:
	$(CC) $(CFLAGS) src/bin/c1.c -o target/release/c1
	$(CXX) $(CXXFLAGS) src/bin/cpp1.cc -o target/release/cpp1
	$(CXX) $(CXXFLAGS) src/bin/cpp2.cc -o target/release/cpp2
	ln -sf `realpath src/bin/main.py` target/release/py1
