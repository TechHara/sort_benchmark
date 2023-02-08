using System;
using System.Collections.Generic;

class LineSorter
{
    static void Main(string[] args)
    {
        var input_file = args.Length >= 1 ? args[0] : "/dev/stdin";
        var output_file = args.Length >= 2 ? args[1] : "/dev/stdout";
        List<string> lines = new List<string>();
        using (StreamReader sr = File.OpenText(input_file))
        {
            string s;
            while ((s = sr.ReadLine()) != null)
            {
                lines.Add(s);
            }
        }
        lines.Sort();
        using (StreamWriter sw = File.CreateText(output_file))
            {
                foreach(var line in lines) {
                    sw.WriteLine(line);
                }
            }
    }
}

