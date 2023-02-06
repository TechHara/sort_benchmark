use std::env::args;
use std::fs::File;
use std::io::{self, BufReader, BufWriter, Read, Write};

fn main() -> io::Result<()> {
    let params: Vec<_> = args().collect();
    let input_file = if params.len() < 2 || params[1] == "-" {
        "/dev/stdin".to_owned()
    } else {
        params[1].clone()
    };
    let output_file = if params.len() < 3 || params[2] == "-" {
        "/dev/stdout".to_owned()
    } else {
        params[2].clone()
    };
    let mut ifs = BufReader::new(File::open(input_file)?);
    let mut buf = String::new();
    ifs.read_to_string(&mut buf)?;

    let mut ofs = BufWriter::new(File::create(output_file)?);

    let mut lines = Vec::new();
    for line in buf.split_inclusive('\n') {
        lines.push(line);
    }

    lines.sort_unstable();
    for line in lines {
        ofs.write_all(line.as_bytes())?;
    }
    Ok(())
}
