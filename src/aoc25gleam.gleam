import day1/day1
import day2/day2
import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn main() -> Nil {
  io.println("Hello from aoc25gleam!")
  run_day(2, False)
}

const day_folder = "src/day"

fn run_day(day: Int, test_input: Bool) -> Nil {
  let path = case test_input {
    True -> day_folder <> int.to_string(day) <> "/test.txt"
    False -> day_folder <> int.to_string(day) <> "/input.txt"
  }
  let lines = read_lines(path)

  case lines {
    Ok(ls) -> {
      io.println("Running Day " <> int.to_string(day))
      case day {
        1 -> {
          day1.day1a(ls) |> io.println
          day1.day1b(ls) |> io.println
        }
        2 -> {
          day2.day2a(ls) |> io.println
        }
        // Add more days here
        _ ->
          io.println("Day " <> int.to_string(day) <> " is not implemented yet.")
      }
    }
    Error(e) -> {
      io.println(
        "Error reading input for Day "
        <> int.to_string(day)
        <> ": "
        <> simplifile.describe_error(e),
      )
    }
  }
}

/// Read a file and split its contents into lines.
/// Returns a Result with a list of lines or an error.
pub fn read_lines(path: String) -> Result(List(String), simplifile.FileError) {
  use contents <- result.try(simplifile.read(path))
  Ok(string.split(contents, "\n") |> list.filter(fn(line) { line != "" }))
}

/// Read a file and split its contents into lines, keeping empty lines.
pub fn read_lines_all(
  path: String,
) -> Result(List(String), simplifile.FileError) {
  use contents <- result.try(simplifile.read(path))
  Ok(string.split(contents, "\n"))
}
