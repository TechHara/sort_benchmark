#include <iostream>
#include <vector>
#include <fstream>
#include <algorithm>
#include <string_view>

int main(int argc, const char **argv) {
    std::string input_file = argc >= 1 ? argv[1] : "/dev/stdin";
    std::string output_file = argc >= 2 ? argv[2] : "/dev/stdout";
    std::ifstream ifs{input_file};
    if (!ifs) return 1;
    std::ofstream ofs{output_file};
    if (!ofs) return 1;

    std::string content( (std::istreambuf_iterator<char>(ifs) ),
                       (std::istreambuf_iterator<char>()    ) );

    std::vector<std::string_view> lines;
    auto first = content.begin();
    const auto last = content.end();
    while (first < last) {
        auto it = std::find(first, last, '\n');
        lines.emplace_back(&*first, ++it - first);
        first = it;
    }

    std::sort(lines.begin(), lines.end());
    for (auto &line : lines) {
        ofs.write(line.data(), line.size());
    }
}