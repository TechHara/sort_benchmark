#include <algorithm>
#include <fstream>
#include <iostream>
#include <vector>

int main(int argc, const char **argv) {
  std::string input_file = argc >= 1 ? argv[1] : "/dev/stdin";
  std::string output_file = argc >= 2 ? argv[2] : "/dev/stdout";
  std::ifstream ifs{input_file};
  if (!ifs)
    return 1;
  std::ofstream ofs{output_file};
  if (!ofs)
    return 1;

  std::vector<std::string> lines;
  std::string line;
  while (std::getline(ifs, line)) {
    lines.push_back(std::move(line));
  }

  std::sort(lines.begin(), lines.end());
  for (auto &line : lines) {
    ofs << line << "\n";
  }
}