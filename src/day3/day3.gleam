import gleam/int
import gleam/list
import gleam/string

pub fn day3a(lines: List(String)) -> String {
  lines
  |> list.map(create_battery_bank)
  |> list.map(find_largest_joltage)
  |> int.sum
  |> int.to_string
}

pub fn create_battery_bank(str: String) -> List(Int) {
  str
  |> string.to_graphemes()
  |> list.filter_map(int.parse)
}

pub fn find_largest_joltage(batteries: List(Int)) -> Int {
  case batteries {
    [] -> 0
    [_] -> 0
    [first, ..rest] -> {
      let #(_, max_joltage) =
        list.fold(rest, #(first, 0), fn(acc, battery) {
          let #(max_tens, max_joltage) = acc
          let candidate = { max_tens * 10 } + battery
          let new_max_joltage = int.max(max_joltage, candidate)
          let new_max_tens = int.max(max_tens, battery)
          #(new_max_tens, new_max_joltage)
        })
      max_joltage
    }
  }
}

pub fn day3b(_lines: List(String)) -> String {
  ""
}
