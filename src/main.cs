using System;
using System.Collections.Generic;
using System.IO;

class LineSorter
{
    static void Main(string[] args)
    {
        var input_file = args.Length >= 1 ? args[0] : "/dev/stdin";
        var output_file = args.Length >= 2 ? args[1] : "/dev/stdout";
        string[] lines = File.ReadAllLines(input_file);
        Array.Sort(lines);
        File.WriteAllLines(output_file, lines);
    }
}

