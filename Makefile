CC = clang
CXX = clang++
CFLAGS = -O3
CXXFLAGS = -O3 -std=c++11
all:
	$(CC) $(CFLAGS) src/main.c -o c
	$(CXX) $(CXXFLAGS) src/main.cc -o cc
	rustc src/main.rs -o rust -C opt-level=3
	javac -d . src/Main.java
	dotnet publish -c Release --sc -r linux-x64 src/cs -o cs
	dotnet publish -c Release --sc -r linux-x64 src/fs -o fs