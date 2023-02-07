import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class Java {
    public static void main(String[] args) throws IOException {
        String input_file = args.length >= 1 ? args[0] : "/dev/stdin";
        String output_file = args.length >= 2 ? args[1] : "/dev/stdout";
        BufferedReader reader = new BufferedReader(new FileReader(input_file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(output_file));
        ArrayList<String> lines = new ArrayList<>();
        while (true) {
            String line = reader.readLine();
            if (line == null) break;
            lines.add(line);
        }
        Collections.sort(lines);
        for (String line : lines) {
            writer.write(line + "\n");
        }
        reader.close();
        writer.close();
    }
}