use std::env::args;
use std::io::{self, BufReader, BufRead, BufWriter, Write};
use std::fs::File;

fn main() -> io::Result<()> {
    let params: Vec<_> = args().collect();
    let input_file = if params.len() < 2 {
        "/dev/stdin".to_owned()
    } else { params[1].clone() };
    let output_file = if params.len() < 3 {
        "/dev/stdout".to_owned()
    } else { params[2].clone() };
    let ifs = BufReader::new(File::open(input_file)?);
    let mut ofs = BufWriter::new(File::create(output_file)?);
    
    let mut lines = Vec::new();
    for line in ifs.lines() {
        let line = line?;
        lines.push(line);
    }

    lines.sort_unstable();
    for line in lines {
        ofs.write_all(line.as_bytes())?;
        ofs.write_all(&[b'\n'])?;
    }
    Ok(())
}
