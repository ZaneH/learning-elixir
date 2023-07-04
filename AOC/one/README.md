# One

For [Advent of Code '22](https://adventofcode.com/2022).

## First Solution

```bash
iex(1)> One.read_file("./input.txt")
|> One.convert_to_int_chunks
|> One.calculate_chunk_sums
```

## Second Solution

```bash
iex(2)> One.read_file("./input.txt")
|> One.convert_to_int_chunks
|> One.calculate_chunk_sums
|> One.sum_top_three
```