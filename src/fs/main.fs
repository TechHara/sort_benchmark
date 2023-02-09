[<EntryPoint>]
let main (args) =
    let input_file =
        match args.Length with
        | 0 -> "/dev/stdin"
        | _ -> args[0]

    let output_file =
        match args.Length >= 2 with
        | false -> "/dev/stdout"
        | true -> args[1]

    let readLines filePath = System.IO.File.ReadAllLines(filePath)

    let writeLines filePath lines =
        System.IO.File.WriteAllLines(filePath, lines)

    readLines input_file |> Seq.sort |> Seq.toArray |> writeLines output_file
    0
